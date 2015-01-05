class CreateYelpSearches < ActiveRecord::Migration
  def change
    create_table :yelp_searches do |t|
      t.string :term
      t.integer :limit
      t.integer :offset
      t.integer :sort
      t.string :category_filter
      t.integer :radius_filter
      t.boolean :deals_filter

      t.timestamps
    end
  end
end
