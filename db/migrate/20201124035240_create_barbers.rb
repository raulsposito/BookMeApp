class CreateBarbers < ActiveRecord::Migration[6.0]
  def change
    create_table :barbers do |t|
      t.string :photo
      t.string :first_name
      t.string :last_name
      t.integer :user_id
      t.integer :account_id

      t.timestamps
    end
    add_index :barbers, :user_id
    add_index :barbers, :account_id
  end
end
