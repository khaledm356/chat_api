class AddSlugToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :slug, :string
    add_index :messages, :slug
  end
end
