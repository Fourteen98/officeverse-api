class CreateJoinTableReservationPeripheral < ActiveRecord::Migration[7.0]
  def change
    create_join_table :reservations, :peripherals do |t|
      # t.index [:reservation_id, :peripheral_id]
      # t.index [:peripheral_id, :reservation_id]
    end
  end
end
