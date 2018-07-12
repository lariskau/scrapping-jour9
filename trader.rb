require 'nokogiri'
require 'open-uri'


def crypto

	while 1 == 1 do

		noms = []
		prix = []

		page = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))

		page.css('a.currency-name-container').each do |nom|
			noms << nom.text
		end

		page.css('a.price').each do |i|
			prix << i.text
		end


		crypto_hash = Hash[noms.zip(prix)]

		crypto_hash.each do |k,v|
		  puts "La monnaie: #{k} à pour valeur: #{v}"
		end

		sleep(3600)

	end

end

crypto
