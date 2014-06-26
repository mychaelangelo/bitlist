# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Create one user
1.times do
  user = User.new(
    name: 'john',
    email: 'john@example.com',
    password: 'password'
  )
  user.skip_confirmation!
  user.save
end

users = User.all




puts "Seed finished"
puts "#{User.count} users created"
puts "#{Todo.count} posts created"