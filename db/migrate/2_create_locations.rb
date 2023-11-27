class CreateLocations < ActiveRecord::Migration[7.1]
  def change
    create_table :locations, id: :uuid do |t|
      t.text :address
      t.references :postal_code, foreign_key: true, type: :uuid
      t.decimal :lat, precision: 10, scale: 6
      t.decimal :lng, precision: 10, scale: 6
      t.integer :geocode_error, default: nil
      t.timestamps
    end
  end
end
