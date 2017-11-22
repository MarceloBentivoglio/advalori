class Invoice < ApplicationRecord
  belongs_to :seller
  belongs_to :invoice_payer
  has_many :installments
  has_many :orders

  validates :number, :total_value, :seller_id, :invoice_payer_id, presence: true

  has_attached_file :xml_file
  do_not_validate_attachment_file_type :xml_file

  after_create :parse_file

  private

  def parse_file
    # tempfile = xml_file.queued_for_write[:original]
    doc = Nokogiri::XML(Paperclip.io_adapters.for(self.xml_file).read)
    self.number = doc.search('fat nFat').text.strip
    self.total_value = doc.search('fat vLiq').text.to_f
    self.seller = Seller.find_by(cnpj: doc.search('emit CNPJ').text.strip)
    self.invoice_payer = InvoicePayer.find_by(cnpj: doc.search('dest CNPJ').text.strip)
    self.save

    dups = doc.search('dup')
    dups.each do |dup|
      installment = Installment.new
      installment.invoice = self
      installment.number = dup.search('nDup').text.strip
      installment.value = dup.search('vDup').text.to_f
      installment.due_date = dup.search('dVenc').text.strip
      installment.save
    end
  end
end

