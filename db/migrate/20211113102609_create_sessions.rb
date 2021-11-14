class CreateSessions < ActiveRecord::Migration[6.1]
  def change
    create_table :sessions, id: :uuid do |t|

      t.timestamps
    end
  end
end
