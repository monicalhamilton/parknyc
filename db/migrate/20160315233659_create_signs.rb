class CreateSigns < ActiveRecord::Migration
  def change
    create_table :signs do |t|
      t.decimal :x_coordinate, null: false
      t.decimal :y_coordinate, null: false
      t.references :street_location, index: true, foreign_key: true
      t.integer :object_id, null: false
      t.integer :sequence_number, null: false
      t.string :sign_code, null: false
      t.integer :curb_distance_feet, null: false
      t.string :sign_faces, null: true
      t.string :sign_arrows, null: true
      t.string :sign_description, null: false

      t.timestamps null: false
    end
  end
end
