require 'nokogiri'
require 'open-uri'

# Tout d'abord, écris une méthode get_the_email_of_a_townhal_from_its_webpage qui, comme son nom l'indique, récupère l'adresse email à partir de l'url d'une mairie, par exemple celle de Vauréal

def get_the_email_of_a_townhal_from_its_webpage(url)
    #Open the web page
    page = Nokogiri::HTML(open(url))
    #Scrap the e-mail address
    page.xpath('//body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
end

puts get_the_email_of_a_townhal_from_its_webpage('http://annuaire-des-mairies.com/95/vaureal.html')


# Ensuite, écris une méthode get_all_the_urls_of_val_doise_townhalls qui, comme son nom l'indique, récupère toutes les url de villes du Val d'Oise. C'est recommandé de le faire de cette page web


def get_all_the_urls_of_val_doise_townhalls
  doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
	doc.css(".lientxt").each do |link|
		url = "http://annuaire-des-mairies.com" + link["href"][1..-1].to_s
		town_name = link.text
		town_email = get_the_email_of_a_townhal_from_its_webpage(url)
		town_hash = {:name => town_name, :email => town_email}
    puts town_hash
  end
end

puts get_all_the_urls_of_val_doise_townhalls
