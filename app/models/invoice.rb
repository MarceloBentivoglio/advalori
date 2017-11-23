class Invoice < ApplicationRecord
  belongs_to :seller
  belongs_to :invoice_payer
  has_many :installments, inverse_of: :invoice
  has_many :orders

  accepts_nested_attributes_for :installments, reject_if: :all_blank, allow_destroy: true

  has_attachment :xml_file, accept: [:xml]

  validates :number, :total_value, :seller_id, :invoice_payer_id, presence: true

  def self.from_file(file)



    # tempfile = xml_file.queued_for_write[:original]
    doc = Nokogiri::XML(file.read)
    file.rewind # Needed since we still need to upload file

    invoice = Invoice.new(xml_file: file)
    invoice.number = doc.search('fat nFat').text.strip
    invoice.total_value = doc.search('fat vLiq').text.to_f
    invoice.seller = Seller.find_by(cnpj: doc.search('emit CNPJ').text.strip)
    invoice.invoice_payer = InvoicePayer.find_by(cnpj: doc.search('dest CNPJ').text.strip)

    return nil if invoice.invoice_payer.nil?

    invoice.save!

    dups = doc.search('dup')
    dups.each do |dup|
      installment = Installment.new
      installment.invoice = invoice
      installment.number = dup.search('nDup').text.strip
      installment.value = dup.search('vDup').text.to_f
      installment.due_date = dup.search('dVenc').text.strip
      installment.save!
    end

    return invoice
  end
end

