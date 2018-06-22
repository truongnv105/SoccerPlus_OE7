class TimeGoal < ApplicationRecord
  belongs_to :match, inverse_of: :time_goals
  belongs_to :team

  after_save :send_information
  validates :time_goal, presence: true

  private

  def send_information
    @information = TimeGoal.last
    ActionCable.server.broadcast "time_goals",
      time_goal: @information.time_goal,
      team: @information.team_id
  end
end
