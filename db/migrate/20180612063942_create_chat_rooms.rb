class CreateChatRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :chat_rooms do |t|
      t.string :name
      t.belongs_to :match, index: {unique: true}, foreign_key: true

      t.timestamps
    end
  end
end
