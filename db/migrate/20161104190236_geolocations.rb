class Geolocations < ActiveRecord::Migration
  def change
    create_table :geolocations do |t|
      t.string :address
      t.integer :lat
      t.integer :lng
      t.references :user, index: true, foreign_key: true
    end
  end
end
