class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  has_many :chat_rooms
  has_many :messages

  validates :name, presence: true, length: {minimum: Settings.users.name.min_length,
    maximum: Settings.users.name.max_length}
  validates :address, presence: true, length: {minimum: Settings.users.address.min_length}
  validates :phone_number, presence: true, length: {minimum: Settings.users.phone_number.min_length,
    maximum: Settings.users.phone_number.max_length}
end
