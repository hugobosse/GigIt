class Booking < ApplicationRecord
  belongs_to :user
  validates :date, presence: true
  # a checker demain en crashtest
  validates :user_id, presence: true
  validates :bar_id, presence: true
end
