class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.string :number
      t.belongs_to :application, index: true, foreign_key: true
      t.integer :messages_count, default: 0

      t.timestamps
    end
    add_index :chats, [:application_id, :number], unique: true
  end
end
