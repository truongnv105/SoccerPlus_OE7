class Match < ApplicationRecord
  has_one :chat_room
  has_many :time_goals, inverse_of: :match, dependent: :destroy

  belongs_to :team_1, class_name: :Team, foreign_key: :team_id_1
  belongs_to :team_2, class_name: :Team, foreign_key: :team_id_2
  belongs_to :league

  accepts_nested_attributes_for :time_goals, allow_destroy: true

  validates :name, presence: true
  validates :start_time, presence: true
  validates :information, presence: true, length: {minimum: Settings.vali.infomation.min_length}
  validates :team_id_1, presence: true
  validates :team_id_2, presence: true

  scope :start_match, ->{where("start_time < ?", Time.now)}

  scope :end_match, ->{where("end_time < ?", Time.now)}

  scope :live, ->(num){where("live = ?", num)}
end
