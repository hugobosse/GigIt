class CreateBars < ActiveRecord::Migration[5.0]
  def change
    create_table :bars do |t|
      t.string :name
      t.string :genre
      t.string :address
      t.date :availabilities
      t.integer :price
      t.string :description

      t.timestamps
    end
  end
end
