class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :restaurant_name, null: false, default: ""
      t.string :address, null: false, default: ""
      t.string :postal_code, null: false, default: ""
      t.string :city, null: false, default: ""
      t.string :state, null: false, default: ""
      t.string :main_phone, null: false, default: ""
      t.string :website, default: ""
      t.string :position, null: false, default: ""
      
      t.timestamps null: false
    end
  end
end
