class TimeGoal < ApplicationRecord
  belongs_to :match, inverse_of: :time_goals
  belongs_to :team

  validates :time_goal, presence: true
end
