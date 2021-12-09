class CreateTrajets < ActiveRecord::Migration[6.1]
  def change
    create_table :trajets, id: :uuid do |t|
      t.string :destination
      t.references :user, null: false, foreign_key: true, type: :uuid
      # t.references :inscription, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
