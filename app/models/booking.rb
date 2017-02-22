class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :bar

  validates :booking_date, presence: true

  validates :bar_rating, numericality: { only_integer: true }, on: :update

end
