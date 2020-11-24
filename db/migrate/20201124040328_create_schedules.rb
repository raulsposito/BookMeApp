class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.datetime :start
      t.datetime :end
      t.integer :barber_id
      t.integer :account_id

      t.timestamps
    end
    add_index :schedules, :barber_id
    add_index :schedules, :account_id
  end
end
