class Match < ApplicationRecord
  belongs_to :league
  has_one :chat_room
  has_many :time_goals
end
