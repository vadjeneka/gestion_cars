class Depense < ApplicationRecord
  belongs_to :user
  belongs_to :car

  validates :nat_depense,
            :description,
            :car_id,
            :date_depense,
            :montant, presence: true
end
