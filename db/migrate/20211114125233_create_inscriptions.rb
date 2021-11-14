class CreateInscriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :inscriptions, id: :uuid do |t|
      t.integer :montant
      t.string :mois
      t.string :nom
      t.string :prenom
      t.string :classe
      t.string :matricule
      t.string :num_parent

      t.timestamps
    end
  end
end
