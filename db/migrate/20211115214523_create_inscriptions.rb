class CreateInscriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :inscriptions, id: :uuid do |t|
      t.string :prenom
      t.string :nom
      t.string :matricule
      t.string :classe
      t.integer :num_parent
      t.integer :montant
      t.string :mois
      t.references :user, null: false, foreign_key: true, type: :uuid
      # t.references :trajet, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
