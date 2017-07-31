class ScrapeContent < ActiveRecord::Base
  belongs_to :scrape_link

  validates :tag, presence: true
  validates :value, presence: true
end
