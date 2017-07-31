require 'test_helper'

class ScrapeLinkTest < ActiveSupport::TestCase
  def setup
    @scrape_link = scrape_links(:girders_link)
  end

  test 'valid scrape link' do
    assert @scrape_link.valid?
  end

  test 'should have scrape contents relationship' do
    assert @scrape_link.scrape_contents.present?
  end
end
