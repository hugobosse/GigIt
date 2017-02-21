class Bar < ApplicationRecord
  validates :name, presence: true, uniqueness: { scope: :address }
  validates :address, presence: true

  has_many :bookings, dependent: :destroy
  belongs_to :user, optional: true
  # belongs to fait comme un validates avec presence true depuis rails 5
  # on peut le rendre optionnel avec optional true
  has_many :artists, through: :bookings, source: :user
  # has_many :users,  through: :bookings (ici on cree une meth artists)
end
