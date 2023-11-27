class CreateTemperatures < ActiveRecord::Migration[7.1]
  def change
    create_table :temperatures, id: :uuid do |t|
      t.integer :postal_code
      t.json :forecast

      t.timestamps
    end
  end
end
