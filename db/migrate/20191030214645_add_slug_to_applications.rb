class AddSlugToApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :applications, :slug, :string
    add_index :applications, :slug, unique: true
  end
end
