class CreatePrefs < ActiveRecord::Migration
  def change
    create_table :prefs do |t|
      t.string :name
      t.references :user

      t.timestamps
    end
  end
end
