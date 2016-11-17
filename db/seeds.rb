# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


ben = User.create!(username: "Ben", email: "myemail@loljk.com")
russell = User.create!(username: "Russell", email: "russellsemail@loljk.com")
alex = User.create!(username: "Alex", email: "alexsemail@loljk.com")

bens_post = ben.posts.create!(name: "Cat pic", link: "https://i.ytimg.com/vi/tntOCGkgt98/maxresdefault.jpg")
russells_post = russell.posts.create!(name: "Cat pic", link: "https://i.ytimg.com/vi/tntOCGkgt98/maxresdefault.jpg")
alexs_post = alex.posts.create!(name: "Cat pic", link: "https://i.ytimg.com/vi/tntOCGkgt98/maxresdefault.jpg")

bens_comment = bens_post.comments.create!(content: "Cool pic bro", user_id: ben.id)
russells_comment = russells_post.comments.create!(content: "Cool pic bro", user_id: russell.id)
alexs_comment = alexs_post.comments.create!(content: "Cool pic bro", user_id: alex.id)
