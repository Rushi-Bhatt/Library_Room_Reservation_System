class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string "room_number", null: false
      t.string "building", null: false
      t.string "size", null: false
      t.timestamps
    end
  end
end
