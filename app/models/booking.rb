class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :bar
  has_many :reviews

  validates :booking_date, presence: true
  validates :user_id, presence: true
  validates :bar_id, presence: true
end
