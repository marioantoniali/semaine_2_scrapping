require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'mechanize'

def get_the_email_of_a_townhal_from_its_webpage(mairie)
    page = Nokogiri::HTML(open(mairie))
    domains = page.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").text
    puts domains
end

def get_all_the_urls_of_val_doise_townhalls
    page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
    domains = page.xpath("//a/@href")
    return domains.map
end

tab = get_all_the_urls_of_val_doise_townhalls

tab.each do |mairie|
    
    if mairie.to_s.include? "95"
        puts mairie.to_s.upcase.sub("./95/", "La mairie de la ville de ").sub(".HTML", " a pour adresse e-mail:")
        get_the_email_of_a_townhal_from_its_webpage(mairie.to_s.sub("./95", "http://annuaire-des-mairies.com/95"))
    end
end