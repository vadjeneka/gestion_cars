class CreateChauffeurs < ActiveRecord::Migration[6.1]
  def change
    create_table :chauffeurs, id: :uuid do |t|
      t.string :nom
      t.string :prenom
      t.integer :numero

      t.references :user,null: false, foreign_key: true, type: :uuid
      t.references :car,null: false, foreign_key: true, type: :uuid
      t.timestamps
    end
  end
end
