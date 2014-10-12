class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.integer :zip
      t.references :restaurant

      t.timestamps
    end
  end
end
