class Bar < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  validates :name, presence: true, uniqueness: { scope: :address }
  validates :address, presence: true
  validates :capacity, presence: true

  has_many :bookings, dependent: :destroy

  has_many :rated_bookings, -> { where.not(bar_rating: nil) }, class_name: "Booking"
  belongs_to :user, optional: true
  # belongs to fait comme un validates avec presence true depuis rails 5
  # on peut le rendre optionnel avec optional true
  has_many :artists, through: :bookings, source: :user
  # has_many :users,  through: :bookings (ici on cree une meth artists)

  has_attachment :photo

  def self.search(params)
    if params["search"]
      if params["search"]["genre"].present? || params["search"]["address"].present?
        if params["search"]["genre"].empty?
          @bars = Bar.near(params["search"]["address"], 20)
        elsif params["search"]["address"].empty?
          @bars = Bar.where("genre LIKE ? ", params["search"]["genre"])
        else
          @bars = Bar.where("genre LIKE ? ", params["search"]["genre"]).near(params["search"]["address"], 20)
        end
      else
        @bars = Bar.all
      end
    else
      @bars = Bar.all
    end
  end

  def ratings
    return -1 if bookings.count.zero?
    bookings.reduce(0) { |sum, b| sum += b.bar_rating.to_i }.fdiv(bookings.count).round()
  end

  def self.genres
    ["jazz", "rock", "pop", "blues", "hip hop", "metal", "country", "classique", "tout genre"]
  end
end



