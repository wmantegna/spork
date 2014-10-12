class AddLookupTables2 < ActiveRecord::Migration
  def change

  	create_table :preferences_restaurants do |t|
      t.belongs_to :restaurant
      t.belongs_to :preference
    end

    create_table :restaurants_restrictions do |t|
      t.belongs_to :restaurant
      t.belongs_to :restriction
    end

  end
end