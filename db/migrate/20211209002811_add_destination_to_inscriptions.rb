class AddDestinationToInscriptions < ActiveRecord::Migration[6.1]
  def change
    add_column :inscriptions, :destination, :string
  end
end
