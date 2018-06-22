class League < ApplicationRecord
  has_many :matches, dependent: :destroy

  validates :name, presence: true, length: {minimum: Settings.vali.name.min_length},
            uniqueness: {case_sensitive: false}
end
