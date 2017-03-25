class CreateChecks < ActiveRecord::Migration[5.0]
  def change
    create_table :checks do |t|
      t.string :name
      t.string :description
      t.integer :parent_id
      t.integer :org_id
      t.integer :range_low
      t.integer :range_high
      t.integer :author_id
      t.boolean :internal_check
      t.string :measure_units
      t.boolean :required

      t.timestamps
    end
  end
end
