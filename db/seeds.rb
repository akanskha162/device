# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

%w(admin employee leader).each do |role|
  Role.find_or_create_by({name: role})
end

# member = Member.new(email:"admin@gmail.com",password: "12345678",password_confirmation: "12345678")
# member.save
# member.add_role("admin")

# ['registered', 'banned', 'moderator', 'admin'].each do |role|
#   Role.find_or_create_by({name: role})
# end
(1..5).each do |i|
  Post.create!(title: "Lipsum Post #{i}", body: %{
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. In feugiat purus dapibus fermentum sagittis. Fusce in tempus felis. Phasellus a erat ut lorem lacinia bibendum. Vivamus viverra facilisis neque, in scelerisque urna pharetra vel. Donec a est mauris. Integer eget metus quis eros egestas elementum. Integer bibendum risus hendrerit dapibus tempor. Fusce placerat in orci vitae tincidunt.
  })
end