class Player < ActiveRecord::Base
  belongs_to :team

  validates :first_name, presence: true
  validates :surname, presence: true
  validates :dob, presence: true, length: { minimum: 10 }
end
