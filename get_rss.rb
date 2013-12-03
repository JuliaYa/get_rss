require 'open-uri'
require 'nokogiri'
require "prawn"


def get_rss(url, count)
	rss = Nokogiri::XML(open(url))
	titles = rss.search('item/title')
	contents = rss.search('item/description')

	data = ''
	counter = 0

	if titles.length < count
		count = titles.length
	end

	titles[0..count].each do |node|
	   data = data + node.inner_text + "\n\n"
	   data = data + contents[counter].inner_text + "\n\n\n"
	   counter = counter + 1
	end

	Prawn::Document.generate("rss.pdf") do
	  text data
	end

	puts 'success!'
end

def get_habr_rss # don't work, need autorisation
	get_rss('http://habrahabr.ru/rss/feed/posts/4345c787866eca0f1e6e2977b29bf275/')
end

def get_tigerslive_rss
	get_rss('http://tigerslife.com/feed/', 5)
end

def get_tigromania_rss
	get_rss('http://tigromania.ru/rss.xml', 5)
end

# get_habr_rss()
# get_tigerslive_rss()
# get_tigromania_rss()

get_rss(ARGV.shift, ARGV.shift.to_i)

# get_rss("http://egghead.io/feed", 5)

# $ ruby ./get_rss.rb "http://egghead.io/feed" 5