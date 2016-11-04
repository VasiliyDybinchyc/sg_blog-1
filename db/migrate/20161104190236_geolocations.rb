class Geolocations < ActiveRecord::Migration
  def change
    create_table :geolocations do |t|
      t.string :address
      t.decimal :lat
      t.decimal :lng
      t.references :user, index: true, foreign_key: true
    end
  end
end
