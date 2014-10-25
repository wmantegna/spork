class CreateRestrics < ActiveRecord::Migration
  def change
    create_table :restrics do |t|
			t.string :name
      t.references :user
      
      t.timestamps
    end
  end
end
