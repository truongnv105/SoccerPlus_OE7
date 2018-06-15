class Match < ApplicationRecord
  has_one :chat_room
  has_many :time_goals

  belongs_to :league

  validates :name, presence: true, length: {minimum: Settings.vali.name.min_length}
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :information, presence: true, length: {minimum: Settings.vali.infomation.min_length}
  validates :team_id_1, presence: true
  validates :team_id_2, presence: true
end
