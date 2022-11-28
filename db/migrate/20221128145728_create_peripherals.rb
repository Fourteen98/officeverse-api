class CreatePeripherals < ActiveRecord::Migration[7.0]
  def change
    create_table :peripherals do |t|
      t.string :name
      t.text :description
      t.decimal :price, default: 0.0

      t.timestamps
    end
  end
end
