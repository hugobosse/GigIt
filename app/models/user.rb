class User < ApplicationRecord
  after_create :send_welcome_email
  has_attachment :photo
  has_attachment :video
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]
  has_many :bookings, dependent: :destroy
  has_many :bars
  has_many :event_places, through: :bookings, source: :bar
  validates :username, presence: true, uniqueness: true
  # à checker si conflit avec device
  # validates :email, presence: true, format: { with: /\A.*@.*\.com\z/ }

  def self.find_for_facebook_oauth(auth)

    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.where(provider: auth.provider, uid: auth.uid).first
    user ||= User.where(email: auth.info.email).first # User did a regular sign up in the past.
    # user = user || User.where...

    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.username = "#{user_params["first_name"]}.#{user_params["last_name"]}"
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end

  private

  def send_welcome_email
    raise
    UserMailer.welcome(self).deliver_now
  end
end
