class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :account_id
      t.string :password_digest

      t.timestamps
    end
  end
end
