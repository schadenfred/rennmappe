class CreateOrgs < ActiveRecord::Migration[5.0]
  def change
    create_table :orgs do |t|
      t.string :name
      t.string :type
      t.string :slug

      t.timestamps
    end

    add_index :orgs, :name
    add_index :orgs, :slug
  end
end
