class CreateStreetLocations < ActiveRecord::Migration
  def change
    create_table :street_locations do |t|
      t.column :borough_key, "char(1)", limit: 1, null: false
      t.string :order_number, null: false
      t.string :main_street, null: false
      t.string :from_street, null: false
      t.string :to_street, null: false
      t.column :side_of_street, "char(1)", limit: 1, null: false

      t.timestamps null: false
    end
  end
end
