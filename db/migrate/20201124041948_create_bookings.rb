class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.string :status
      t.datetime :start
      t.text :cancelation_reason
      t.integer :barber_id
      t.integer :schedule_id
      t.integer :haircut_id
      t.integer :account_id

      t.timestamps
    end
    add_index :bookings, :barber_id
    add_index :bookings, :schedule_id
    add_index :bookings, :haircut_id
    add_index :bookings, :account_id
  end
end
