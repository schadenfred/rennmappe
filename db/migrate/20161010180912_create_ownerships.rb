class CreateOwnerships < ActiveRecord::Migration[5.0]
  def change
    create_table :ownerships do |t|
      t.integer :vehicle_id
      t.integer :owner_id
      t.date :ownership_begin
      t.date :ownership_end

      t.timestamps
    end

    add_index :ownerships, [:vehicle_id, :owner_id]
  end
end
