require 'test_helper'

class ScrapeContentTest < ActiveSupport::TestCase
  def setup
    @scrape_content = scrape_contents(:girders_content_h1)
  end

  test 'valid scrape content' do
    assert @scrape_content.valid?
  end

  test 'should have scrape link relationship' do
    assert @scrape_content.scrape_link.present?
  end
end
