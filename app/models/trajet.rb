class Trajet < ApplicationRecord
  belongs_to :user
  has_many :cars
  has_many :inscriptions
  validates :destination,presence: true
end
