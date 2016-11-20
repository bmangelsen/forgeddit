# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ben = User.create!(username: "Ben", email: "myemail@loljk.com", password: "password")
russell = User.create!(username: "Russell", email: "russellsemail@loljk.com", password: "password")
alex = User.create!(username: "Alex", email: "alexsemail@loljk.com", password: "password")

3.times do
  ben.posts.create!(name: FFaker::Book.title, link: "https://i.ytimg.com/vi/tntOCGkgt98/maxresdefault.jpg")
  russell.comments.create!(content: FFaker::Tweet.body, post_id: ben.posts.last.id)
  alex.comments.create!(content: FFaker::Tweet.body, post_id: ben.posts.last.id)
end

3.times do
  russell.posts.create!(name: FFaker::Book.title, link: "https://i.ytimg.com/vi/tntOCGkgt98/maxresdefault.jpg")
  ben.comments.create!(content: FFaker::Tweet.body, post_id: russell.posts.last.id)
  alex.comments.create!(content: FFaker::Tweet.body, post_id: russell.posts.last.id)
end

3.times do
  alex.posts.create!(name: FFaker::Book.title, link: "https://i.ytimg.com/vi/tntOCGkgt98/maxresdefault.jpg")
  ben.comments.create!(content: FFaker::Tweet.body, post_id: alex.posts.last.id)
  russell.comments.create!(content: FFaker::Tweet.body, post_id: alex.posts.last.id)
end
