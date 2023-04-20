require 'http'
require 'json'
require "dotenv"
require 'rubygems'
require 'nokogiri'
require 'open-uri'


page = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/html"))
puts page.class

names_cities_links = page.xpath('//tbody/tr/td/p[@class="lientxt"]').map{ |tri| tri.text }

mail_links = page.xpath('//tbody[@class="txt-primary tr-last"]').map{ |element_2| element_2.text}

puts names_cities_links.inspect
puts mail_links.inspect

hash = [names_cities_links, mail_links].transpose.to_h

puts hash.inspect