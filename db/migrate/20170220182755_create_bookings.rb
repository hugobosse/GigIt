class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.date :booking_date
      t.integer :bar_rating
      t.string :bar_review
      t.integer :user_rating
      t.string :user_review
      t.references :user, foreign_key: true, index: true
      t.references :bar, foreign_key: true, index: true

      t.timestamps
    end
  end
end
