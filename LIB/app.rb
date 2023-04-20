require 'http'
require 'json'
require "dotenv"
require 'rubygems'
require 'nokogiri'
require 'open-uri'


page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
puts page.class

all_names_links = page.xpath('//tbody/tr/td/div/a[@class="cmc-table__column-name--name cmc-link"]').map{ |tri| tri.text }

all_prices_links = page.xpath('//tbody/tr/td/div/a[@class="cmc-table-row"]').map{ |tri2| tri2 }

puts all_names_links.inspect
puts all_prices_links.inspect

# def cryptos (all_names_links, all_prices_links)
# hash = all_names_links.zip(all_prices_links).to_h
# print hash
# end