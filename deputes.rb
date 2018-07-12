require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'mechanize'

#Methode sortir mail
def get_mail(adress)
  page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr#{adress}"))
    mail_deputy = page.css("dd a.email").map { |mail| mail['href'].sub("mailto:", "")}
end


#Methode sortir url de leur fiche depute
def get_url
  page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
    url_deputy = page.css("ul.col3 a")
end

#Methode perform
def perform
    identity = []
    contact = []
    url_all = get_url #definition de la variable en fonction de la methode get_url
    url_all.each do |url| #parcourir la variable 
       identity.push(url.text.split) #afficher le texte de la balise pour chaque element soit le nom puis le prenom du depute
       contact.push(get_mail(url['href']))
       hash = identity.zip(contact)
       puts hash
    end
  end

  perform