# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.create!(name: "Admin Account",
#             email: "Admin@se.com",
#             title: "Senior SQE",
#             password: "111111",
#             password_confirmation: "111111",
#             admin: true)
            
#尝试过种子测试分页但是失败了。。。
#Users
50.times do |n|
  name = "Test-#{n+100}"
  email = "Test-#{n+100}@se.com"
  password = "111111"
  title = "SQE"
  User.create!(name: name,
  email: email,
  title: title,
  password: password,
  password_confirmation: password)
end

# # Problems
# users = User.order(:created_at).take(6)
# 50.times do
#   Description = Faker::Lorem.sentence(5)
#   Status = "Open"
#   ProductName = "Test"
#   ProductID = "001"
#   Detected_at = Time.zone.now
#   BoL = "BL"
#   CRNo = "001"
#   Link = "https://www.baidu.com"
#   Supplier = "G-Shank
  
#   users.each { |user| user.problems.create!(Description: Description
#                                             Status: Status
#                                             ProductID: ProductID
#                                             ProductName: ProductName
#                                             Detected_at: Detected_at
#                                             BoL: BoL
#                                             CRNo: CRNo
#                                             Link: Link
#                                             Supplier: Supplier) }
# end