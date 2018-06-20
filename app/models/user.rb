class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2, :twitter]

  has_many :messages, dependent: :destroy
  has_many :chat_rooms, through: :messages

  validates :name, presence: true, length: {minimum: Settings.users.name.min_length,
    maximum: Settings.users.name.max_length}
  validates :address, presence: true, length: {minimum: Settings.users.address.min_length}
  validates :phone_number, presence: true, length: {minimum: Settings.users.phone_number.min_length,
    maximum: Settings.users.phone_number.max_length}
  validates_presence_of :password_confirmation, if: :password

  def self.from_omniauth auth
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      if auth.info.email.nil?
        auth.info.email = Faker::Internet.email
      end
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.password_confirmation = user.password
      user.name = auth.info.name
      user.address = Faker::Address.city
      user.phone_number = Faker::PhoneNumber.subscriber_number(10)
      user.skip_confirmation!
    end
  end
end
