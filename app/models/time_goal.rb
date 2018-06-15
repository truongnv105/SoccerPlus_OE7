class TimeGoal < ApplicationRecord
  belongs_to :match
  belongs_to :team

  validates :time_goal, presence: true
end
