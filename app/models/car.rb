class Car < ApplicationRecord
  validates :immatriculation,
            :couleur,
            :nbre_place,presence: true
  belongs_to :user
  has_many :chauffeurs
  has_many :depenses
  has_many :trajets
end
