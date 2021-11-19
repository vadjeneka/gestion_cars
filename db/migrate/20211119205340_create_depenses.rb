class CreateDepenses < ActiveRecord::Migration[6.1]
  def change
    create_table :depenses, id: :uuid do |t|
      t.string :nat_depense
      t.text :description
      t.integer :montant
      t.date :date_depense
      
      t.references :user,null: false, foreign_key: true, type: :uuid
      t.references :car,null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
