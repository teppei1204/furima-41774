class CreateDestinations < ActiveRecord::Migration[7.0]
  def change
    create_table :destinations do |t|
      t.string :city, null: false
      t.references :card, null: false, foreign_key: true
      t.string :phone_number, null: false
      t.integer :prefecture_id, null: false
      t.string :building_name
      t.string :post_code, null: false
      t.string :address, null: false
      
      t.timestamps
    end
  end
end
