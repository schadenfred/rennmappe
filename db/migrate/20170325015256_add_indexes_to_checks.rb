class AddIndexesToChecks < ActiveRecord::Migration[5.0]
  def change

    add_index :checks, :author_id
    add_index :checks, :name
    add_index :checks, :org_id
    add_index :checks, :parent_id
  end
end
