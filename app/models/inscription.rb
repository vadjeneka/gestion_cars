class Inscription < ApplicationRecord
  validates :prenom, 
            :nom,
            :montant,
            :matricule,
            :mois,
            :num_parent,
            :destination,
            :classe ,presence: true
belongs_to :user
has_one :trajet
end
