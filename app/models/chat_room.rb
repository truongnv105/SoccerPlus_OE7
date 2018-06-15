class ChatRoom < ApplicationRecord
  has_many :messages, dependent: :destroy

  belongs_to :match

  validates :name, presence: true, length: {minimum: Settings.vali.name.min_length}
  validates :match_id, uniqueness: {case_sensitive: false}
end
