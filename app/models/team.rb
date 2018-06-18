class Team < ApplicationRecord
  has_many :time_goals
  has_many :matches

  validates :name, presence: true, uniqueness: {case_sensitive: false}
end
