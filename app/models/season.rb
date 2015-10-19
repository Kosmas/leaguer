# Handles the seasons in the league
class Season < ActiveRecord::Base
  has_and_belongs_to_many :teams
end
