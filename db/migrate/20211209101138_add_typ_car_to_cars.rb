class AddTypCarToCars < ActiveRecord::Migration[6.1]
  def change
    add_column :cars, :typ_car, :string
  end
end
