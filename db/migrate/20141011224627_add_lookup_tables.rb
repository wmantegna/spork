class AddLookupTables < ActiveRecord::Migration
  def change

    create_table :preferences_users do |t|
      t.belongs_to :user
      t.belongs_to :preference
    end

    create_table :restrictions_users do |t|
      t.belongs_to :user
      t.belongs_to :restriction
    end

  end
end
