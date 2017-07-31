require 'mechanize'

class ScrapeLink < ActiveRecord::Base
  has_many :scrape_contents

  validates :url, presence: true

  after_create :scrape

  private

    def scrape
      mechanize = Mechanize.new
      page = mechanize.get(url)
#byebug
      page.search('h1').each { |data| scrape_contents.create('tag': 'h1', 'value': data.text) if data.text.present? }
      page.search('h2').each { |data| scrape_contents.create('tag': 'h1', 'value': data.text) if data.text.present? }
      page.search('h3').each { |data| scrape_contents.create('tag': 'h1', 'value': data.text) if data.text.present? }
      page.links.each { |data| scrape_contents.create('tag': 'a', 'value': data.href) if data.href.present? }

      #   puts "#{link.text} => #{link.href}"}
       #byebug
    end
end
