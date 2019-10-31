class AddSlugToChats < ActiveRecord::Migration[5.2]
  def change
    add_column :chats, :slug, :string
    add_index :chats, :slug
  end
end
