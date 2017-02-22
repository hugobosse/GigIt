class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :bar
  has_many :reviews

  validates :booking_date, presence: true

end
