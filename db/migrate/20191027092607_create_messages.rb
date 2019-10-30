class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.integer :number
      t.belongs_to :chat, index: true, foreign_key: true
      t.belongs_to :application, index: true, foreign_key: true
      t.text :body

      t.timestamps
    end
   end
end
