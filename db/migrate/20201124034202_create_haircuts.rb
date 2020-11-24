class CreateHaircuts < ActiveRecord::Migration[6.0]
  def change
    create_table :haircuts do |t|
      t.integer :duration

      t.timestamps
    end
  end
end
