require 'test_helper'

class Api::ScrapeLinksControllerTest < ActionDispatch::IntegrationTest

  test 'get index' do
    get api_scrape_links_url
    assert_response :success
    assert_equal 1, JSON.parse(@response.body)["data"].count
  end

  test 'get index with filter' do
    get api_scrape_links_url, params: { url: 'http://girders.org/blog/2016/08/26/building-rails-apis-with-jsonapi-and-jsonapi-resources/' }.to_json
    assert_response :success
    assert_equal 'http://girders.org/blog/2016/08/26/building-rails-apis-with-jsonapi-and-jsonapi-resources/', JSON.parse(@response.body)['data'][0]['attributes']['url']
  end

  test 'post create' do
    post api_scrape_links_url, params:
      {
        data: {
          type: "scrape_links",
          attributes: {
            url: "http://www.kidzone.ws/cursive/v.htm"
          }
        }
      }.to_json, headers: { 'Content-Type' => 'application/vnd.api+json' }

    assert_response :success
    assert_equal 'scrape-links', JSON.parse(@response.body)['data']['type']
  end
end
