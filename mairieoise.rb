require 'rubygems'
require 'nokogiri'
require 'open-uri'

#scrapper un email de l'annuaire des mairies du Val d'Oise : test sur villaines-sous-bois
doc = Nokogiri::HTML(open('http://annuaire-des-mairies.com/95/villaines-sous-bois.html'))

puts "### Search for nodes by css"
doc.css('p:contains("@")').each do |link|
  puts link.content
end

#scrapper tous les emails

puts "### Search for nodes by css"
doc.css("a.lientxt").each_with_object(Hash.new(0)) do |townhall, hash|
  town_name = townhall.text
  link = "http://annuaire-des-mairies.com" + townhall['href'][1..-1]
  email = get_the_email_of_a_townhal_from_its_webpage(link)
  hash[town_name] = email
end

#j'ai travaillé sur le projet mais je suis trop en retard sur les contenus des cours
#pour comprendre la structure attendue
