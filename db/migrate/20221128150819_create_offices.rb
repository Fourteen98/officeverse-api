class CreateOffices < ActiveRecord::Migration[7.0]
  def change
    create_table :offices do |t|
      t.string :title
      t.string :description
      t.string :area
      t.integer :occupancy, default: 0
      t.string :images
      t.decimal :basic_price, default: 0.0
      t.string :address

      t.timestamps
    end
  end
end
