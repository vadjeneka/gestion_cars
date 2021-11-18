class Trajet < ApplicationRecord
  belongs_to :user
  has_many :cars
  validates :destination,presence: true
end
