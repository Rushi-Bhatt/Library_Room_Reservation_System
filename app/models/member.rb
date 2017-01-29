class Member < ActiveRecord::Base
  has_secure_password

  validates :first_name, :presence => {:message => "Please enter your first name"} , length: { maximum: 30 }
  validates :last_name, :presence => {:message => "Please enter your last name"}, length: { maximum: 30 }
  validates :dob, :presence => {:message => "Please enter your date of birth"}
  validates :email_id, :presence => {:message => "Please enter your email id"}, uniqueness: { case_sensitive: false }, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :gender, :presence => {:message => "Please select your gender"}

end
