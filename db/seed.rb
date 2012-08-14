require 'open-uri'
require 'nokogiri'

# brands
doc = Nokogiri::XML(open('http://shop.nordstrom.com/c/womens-brands?section=shoes&origin=topnav'))
doc.xpath("//div[@id='shoes']//a").each do |brand|
	Brand.create :name => brand.text
end

brands = Brand.all

# shoes
begin
	doc = Nokogiri::XML(open('http://rss.nordstrom.com/rss.axd?keyword=women%27s%20shoes&sort=price&sortreverse=1&origin=sricon'))
	Nokogiri::XML(doc.xpath('//item/description').each_with_index do |description, n|
		begin
			description_text = Nokogiri::XML(description.text)
			name = description_text.xpath("//a[@class='rssTitleLink1']").text
			brand_id = -1
			brands.each do |brand|
				brand_id = brand.id if name.include? brand.name
			end
			if brand_id == -1
				else
				price = description_text.xpath("//span[@class='rssPrice1']").last.text.split('Price: ').last
				description2 = description_text.xpath("//span[@class='rssDescription2']").text
				month = (n + 1) % 12
				month = 1 if month == 0 # December should not have any shoes
				image_url = nil
				image_url = description_text.xpath("//img").first['src'] unless (month == 11) # the 11th item should not have an image
				Shoe.create :name => name, :price => price, :image_path => image_url, :description => description2, :release_month => Date::MONTHNAMES[month], :brand_id => brand_id
			end
		rescue e => Error
			p e.message
		end
	end)
rescue
	p "sumn happened, but I have #{Shoe.all.length} shoes in the database!"
end

