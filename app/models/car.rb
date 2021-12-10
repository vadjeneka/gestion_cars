class Car < ApplicationRecord
  validates :immatriculation,
            :couleur,
            :typ_car,
            :nbre_place,presence: true
  belongs_to :user
  has_many :chauffeurs
  has_many :depenses
  has_many :trajets, dependent: :destroy
end
