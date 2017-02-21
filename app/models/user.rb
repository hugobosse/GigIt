class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :bookings, dependent: :destroy
  has_many :bars
  has_many :event_places, through: :bookings, source: :bar
  validates :username, presence: true, uniqueness: true
  # à checker si conflit avec device
  # validates :email, presence: true, format: { with: /\A.*@.*\.com\z/ }
end
