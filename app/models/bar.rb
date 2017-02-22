class Bar < ApplicationRecord
  validates :name, presence: true, uniqueness: { scope: :address }
  validates :address, presence: true

  has_many :bookings, dependent: :destroy
  belongs_to :user, optional: true
  # belongs to fait comme un validates avec presence true depuis rails 5
  # on peut le rendre optionnel avec optional true
  has_many :artists, through: :bookings, source: :user
  # has_many :users,  through: :bookings (ici on cree une meth artists)

  def self.search(params)
    if params["search"]["genre"].present? || params["search"]["address"].present?
      if params["search"]["genre"].empty?
        @bars = Bar.where("address LIKE ? ", params["search"]["address"])
      elsif params["search"]["address"].empty?
        @bars = Bar.where("genre LIKE ? ", params["search"]["genre"])
      else
        @bars = Bar.where("genre LIKE ? ", params["search"]["genre"])
                   .where("address LIKE ? ", params["search"]["address"])
      end
    else
      @bars = Bar.all
    end
  end
end



