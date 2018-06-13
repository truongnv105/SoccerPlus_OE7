class ChatRoom < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :users, through: :messages

  belongs_to :match

  validates :name, presence: true, length: {minimum: Settings.vali.name.min_length}
  validates :match_id, uniqueness: {case_sensitive: false}
end
