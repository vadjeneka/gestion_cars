class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars, id: :uuid do |t|
      t.string :immatriculation
      t.string :couleur
      t.integer :nbre_place
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
