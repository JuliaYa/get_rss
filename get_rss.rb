require 'open-uri'
require 'nokogiri'
require "prawn"


def get_rss url
	rss = Nokogiri::XML(open(url))
	titles = rss.search('item/title')
	# puts titles

	Prawn::Document.generate("rss.pdf") do
	  data = ''
	  titles.each do |node|
		   data = data + node.inner_text + "\n"
	  end
	  text data
	end
	puts 'success!'
end

def get_habr_rss
	get_rss ('http://habrahabr.ru/rss/feed/posts/4345c787866eca0f1e6e2977b29bf275/')
end

def get_tigerslive_rss
	get_rss ('http://tigerslife.com/feed/')
end

def get_tigromania_rss
	get_rss ('http://tigromania.ru/rss.xml')
end

# get_habr_rss()
#get_tigerslive_rss()
#get_tigromania_rss()
str = ARGV[0]
get_rss (str)

# $ ruby ./get_rss.rb "http://egghead.io/feed"