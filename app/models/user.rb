class User < ApplicationRecord
  validates :prenom, 
            :nom,
            :email,
            :telephone,
            :password,
            :password_confirmation,presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  has_secure_password
  has_many :inscriptions
  has_many :cars
  has_many :trajets
  has_many :depenses
end