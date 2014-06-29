class Ride < ActiveRecord::Base
  validates :starting_point, presence: true
  validates :destination, presence: true
  belongs_to :user
end
