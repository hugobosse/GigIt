class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :bookings
  validates :name, presence: true, uniqueness: true
  # à checker si conflit avec device
  # validates :email, presence: true, format: { with: /\A.*@.*\.com\z/ }
end
