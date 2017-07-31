### Installation

* set db credentials in db/database.yml
* bundle install
* rake db:create
* rake db:migrate
* rails s -b 0.0.0.0

### Get scrape links
Headers
key: Content-Type
value: application/vnd.api+json
/api/scrape-links

### Create scrape link
POST /api/scrape-links
Headers
key: Content-Type
value: application/vnd.api+json
Body
```sh
{
  "data": {
    "type": "scrape_links",
    "attributes": {
      "url": "http://girders.org/blog/2016/08/26/building-rails-apis-with-jsonapi-and-jsonapi-resources/"
    }
  }
}
```
###  Filter scrape link by url
Headers
key: Content-Type
value: application/vnd.api+json
/api/scrape-links?filter[url]=http://girders.org/blog/2016/08/26/building-rails-apis-with-jsonapi-and-jsonapi-resources/

### Get scrape contents filtered by scrape link url
Headers
key: Content-Type
value: application/vnd.api+json
/api/scrape-contents?include=scrape-link&filter[scrape_links.url]=http://girders.org/blog/2016/08/26/building-rails-apis-with-jsonapi-and-jsonapi-resources/

### Testing

* rake db:migrate RAILS_ENV=test
* rake test
