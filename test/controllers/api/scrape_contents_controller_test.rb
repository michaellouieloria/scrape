require 'test_helper'

class Api::ScrapeContentsControllerTest < ActionDispatch::IntegrationTest

  test 'get index' do
    get api_scrape_contents_url
    assert_response :success
    assert_equal 4, JSON.parse(@response.body)["data"].count
  end

  test 'get index with filter' do
    get api_scrape_contents_url, params:
      {
        include: 'scrape-link',
        filter: {
          'scrape_links.url': 'http://girders.org/blog/2016/08/26/building-rails-apis-with-jsonapi-and-jsonapi-resources/'
        }
      }.to_json
    assert_response :success
    assert_equal 4, JSON.parse(@response.body)["data"].count
  end
end
