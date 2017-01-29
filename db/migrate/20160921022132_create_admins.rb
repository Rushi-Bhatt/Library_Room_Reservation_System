class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string "email_id",null: false
      t.string "first_name", null: false
      t.string "last_name" , null:false
      t.string "gender", null:false
      t.date "dob", null:false
      t.string "password_digest"
    end
  end
end
