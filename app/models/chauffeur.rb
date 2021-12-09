class Chauffeur < ApplicationRecord
  belongs_to :user
  belongs_to :car

  validates :nom,
            :prenom,
            :car_id,
            :numero,
            :montant, presence: true
end
