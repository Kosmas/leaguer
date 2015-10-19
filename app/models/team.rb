# Handles the teams in the league
class Team < ActiveRecord::Base
  has_many :players, dependent: :delete_all
  has_and_belongs_to_many :seasons

  validates :name, presence: true
end
