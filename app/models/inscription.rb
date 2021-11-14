class Inscription < ApplicationRecord
  validates :prenom, 
            :nom,
            :montant,
            :matricule,
            :mois,
            :num_parent,
            :classe,presence:true
  belongs_to :user
end