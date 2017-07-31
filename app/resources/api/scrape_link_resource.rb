class Api::ScrapeLinkResource < JSONAPI::Resource
  attributes :url
  has_many :scrape_contents

  filter :url
end
