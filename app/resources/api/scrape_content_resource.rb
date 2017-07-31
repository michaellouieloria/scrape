class Api::ScrapeContentResource < JSONAPI::Resource
  attributes :tag, :value
  has_one :scrape_link

  filter :'scrape_links.url'
end
