# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


puts "Executing seed file to create SuperAdmin"

d = Time.now
superAdmin = Admin.new
superAdmin.email_id = "sadmin@ncsu.edu"
superAdmin.first_name = "Super"
superAdmin.last_name = "Admin"
superAdmin.password = "ncsu"
superAdmin.password_confirmation = "ncsu"
superAdmin.gender = "NA"
superAdmin.dob = d
superAdmin.save

puts "End of seed file execution"
