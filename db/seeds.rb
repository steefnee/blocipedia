require 'faker'

5.times do

user = User.create!(
email:    Faker::Internet.email,
password: Faker::Internet.password(8)
	  )
end

users = User.all

10.times do
  wiki = Wiki.create!(
    title: Faker::Lorem.word,
    body: Faker::Lorem.sentence,
    user: users.sample,
  )
end
wikis = Wiki.all

user = User.first
user.update_attributes!(
  email: 'stephaniepui@outlook.com',
  password: 'password'
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} items created"
