class Team < ApplicationRecord
  has_many :time_goals

  validates :name, presence: true, length: {minimum: Settings.vali.name.min_length}
end
