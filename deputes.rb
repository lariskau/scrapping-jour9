require 'nokogiri'
require 'open-uri'


def deputes

noms = []
final = []
name = []
first_name = []



  page = Nokogiri::HTML(open('http://www2.assemblee-nationale.fr/deputes/liste/alphabetique'))

  page.css('ul.col3 li a').each do |nom|
    noms << nom.text
  end

  noms.each do |mail|
    mails = mail.split(' ')[1..-1].join(' ').downcase
    new_mail = mails.split(",")
    new_mails = new_mail.map { |word| word.gsub(' ','.')}
    end_mail = new_mails.map { |i| i + "@assemblee-nationale.fr"}
    final << end_mail
  end


  mon_hash = Hash[noms.zip(final)]

  mon_hash.each do |k,v|
    puts "Nom: #{k} Email: #{v.join("','")}"
  end

end

deputes
