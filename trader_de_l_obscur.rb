require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'mechanize'


def trader_crypto
    page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
    domains_1 = page.xpath("//table/tbody/tr/td/a[@class='currency-name-container link-secondary']").map{|currency| currency.text}
    domains_2 = page.xpath("//table/tbody/tr/td/a[@class='price']").map{|price| price.text}
    domains_3 = page.xpath("//td[@data-timespan='1h']").map{|rate| rate.text}

my_hash=domains_1.zip(domains_2, domains_3)

puts my_hash
end

trader_crypto
