class CollectMedicineDetailsJob < ActiveJob::Base
  queue_as :default

  def perform
    doc = Nokogiri::HTML(open('http://www.medguideindia.com/show_brand.php'))

    links_div = doc.css('.tabsborder2 table .mosttext')
    links = links_div.search('option').map { |link| "http://www.medguideindia.com/#{link['value']}"}

    j = [1, 2, 3, 4, 7, 8]

    while link = links.pop do
      begin
        med_array = []
        doc = Nokogiri::HTML(open(link))

        med = doc.css('.tabsborder2')

        for i in 2..51
          hash = {}
          j.each do |num|
            hash[:"#{find_key(num)}"] = med.at_css(".row:nth-child(#{i}) .mosttext:nth-child(#{num})").text.strip
          end
          Madicine.create(hash)
        end
      rescue => e
      end
    end
  end

  private

  def find_key(value)
    case value
    when 1
      return 'sl_no'
    when 2
      return 'manufacturer'
    when 3
      return 'name'
    when 4
      return 'm_type'
    when 7
      return 'unit'
    else
      return 'price'
    end
  end
end