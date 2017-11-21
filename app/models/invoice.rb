class Invoice < ApplicationRecord
  belongs_to :seller
  has_attached_file :xml_file
  do_not_validate_attachment_file_type :xml_file
  before_save :parse_file

  private

  def parse_file
    tempfile = xml_file.queued_for_write[:original]
    doc = Nokogiri::XML(tempfile)
    self.number = doc.search('fat nFat').text
    self.total_value = doc.search('fat vLiq').text.to_f
  end
end
