class CreateScrapeLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :scrape_links do |t|
      t.string :url

      t.timestamps null: false
    end
  end
end
