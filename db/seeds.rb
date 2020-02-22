# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name: "Admin Account",
            email: "Admin@se.com",
            title: "Senior SQE",
            password: "111111",
            password_confirmation: "111111",
            admin: true)
            
#Users
10.times do |n|
  name = "Test-#{n+1}"
  email = "Test-#{n+1}@se.com"
  password = "111111"
  title = "SQE"
  User.create!(name: name,
  email: email,
  title: title,
  password: password,
  password_confirmation: password)
end


# #尝试过种子测试分页但是失败了。。。
# # Problems
# users = User.order(:created_at).take(6)
# 50.times do
#   description = Faker::Lorem.sentence(5)
#   status = "Open"
#   productname = "Test"
#   productid = "001"
#   detected_at = Time.zone.now
#   lob = "BL"
#   crno = "001"
#   link = "https://www.baidu.com"
#   supplier = "G-Shank
  
# users.each do |user|
#   user.problems.create!(description: description
#                         status: status
#                         productid: productid
#                         productname: productname
#                         detected_at: detected_at
#                         lob: lob
#                         crno: crno
#                         link: link
#                         supplier: supplier) 
# end