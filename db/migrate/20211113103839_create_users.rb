class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users, id: :uuid do |t|
      t.string :prenom
      t.string :nom
      t.string :email
      t.string :telephone
      t.string :password
      t.string :password_digest

      t.timestamps
    end
  end
end
