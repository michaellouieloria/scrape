class CreateScrapeContents < ActiveRecord::Migration[5.1]
  def change
    create_table :scrape_contents do |t|
      t.references :scrape_link, index: true, foreign_key: true
      t.string :tag
      t.text :value

      t.timestamps null: false
    end
  end
end
