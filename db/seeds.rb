# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
first_user = User.create!(name: 'Juarez', photo: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1374&q=80', bio: 'Teacher from Mexico.')
second_user = User.create!(name: 'Lilly', photo: 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80', bio: 'Teacher from Poland.')
first_user.posts.create!(title: 'Hello', text: 'This is Juarez first post')
first_user.posts.create!(title: 'Hello', text: 'This is Juarez second post')
first_user.posts.create!(title: 'Hello', text: 'This is Juarez third post')
first_user.posts.create!(title: 'Hello', text: 'This is Juarez fourth post')
first_user.posts.create!(title: 'Hello', text: 'This is Juarez fifth post')
second_user.posts.create!(title: 'Hello', text: 'This is Lilly first post')
second_user.posts.create!(title: 'Hello', text: 'This is Lilly second post')
second_user.posts.create!(title: 'Hello', text: 'This is Lilly third post')
second_user.posts.create!(title: 'Hello', text: 'This is Lilly fourth post')
second_user.posts.create!(title: 'Hello', text: 'This is Lilly fifth post')

Comment.create!(post_id: 1, user_id: 1, text: 'Hi Tom!' )
Comment.create!(post_id: 1, user_id: 1, text: 'Hi John!' )
Comment.create!(post_id: 1, user_id: 1, text: 'Hi Jakie!' )
Comment.create!(post_id: 1, user_id: 2, text: 'Hi Chan!' )
Comment.create!(post_id: 1, user_id: 2, text: 'Hi Nick!' )
Comment.create!(post_id: 1, user_id: 2, text: 'Hi Will!' )
Comment.create!(post_id: 2, user_id: 1, text: 'Hi Norton!' )
Comment.create!(post_id: 3, user_id: 2, text: 'Hi Pikachu!' )
Comment.create!(post_id: 4, user_id: 1, text: 'Hi Bruce!' )
Comment.create!(post_id: 5, user_id: 2, text: 'Hi Messi!' )

Like.create!(post_id: 1, user_id: 1)
Like.create!(post_id: 2, user_id: 1)
Like.create!(post_id: 3, user_id: 1)
Like.create!(post_id: 4, user_id: 2)
Like.create!(post_id: 5, user_id: 2)
Like.create!(post_id: 1, user_id: 2)
Like.create!(post_id: 1, user_id: 2)