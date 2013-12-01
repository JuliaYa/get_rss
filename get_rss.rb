require 'open-uri'
require 'nokogiri'

def get_habr_rss
	#doc = Nokogiri::HTML(open("http://habrahabr.ru/"))
	#RSS_URL = 'http://habrahabr.ru/'
	#PROXY = ???
	#open('http://tigerslife.com/')
	rss = Nokogiri::HTML(open('http://tigerslife.com/'))
	titles = rss.search('h2')
	puts titles
end

get_habr_rss()