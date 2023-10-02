require 'rails_helper'

RSpec.feature 'User Index Page', type: :feature do
  # users
  let!(:user1) { create(:user, name: 'Lilly', bio: 'teacher') }
  let!(:user2) { create(:user, name: 'John', bio: 'student') }
  let!(:user3) { create(:user, name: 'Jane', bio: 'student') }
  let!(:user4) { create(:user, name: 'Jack', bio: 'student') }
  let!(:user5) { create(:user, name: 'Jill', bio: 'student') }
  let!(:user6) { create(:user, name: 'Joe', bio: 'student') }
  let!(:user7) { create(:user, name: 'Jenny', bio: 'student') }
  
  # posts
  let!(:post1) { create(:post, author: user1, title: 'Post 1', text: 'This is Post 1') }
  let!(:post2) { create(:post, author: user2, title: 'Post 2', text: 'This is Post 2') }
  let!(:post3) { create(:post, author: user1, title: 'Post 3', text: 'This is Post 3') }
  let!(:post4) { create(:post, author: user1, title: 'Post 4', text: 'This is Post 4') }
  let!(:post5) { create(:post, author: user1, title: 'Post 5', text: 'This is Post 5') }
 
  # comments
  let!(:comment1) { create(:comment, post: post1, user: user2, text: 'Comment on post 1 by John') }
  let!(:comment2) { create(:comment, post: post1, user: user3, text: 'Comment on post 1 by Jane') }
  let!(:comment3) { create(:comment, post: post1, user: user4, text: 'Comment on post 1 by Jack') }
  let!(:comment4) { create(:comment, post: post1, user: user5, text: 'Comment on post 1 by Jill') }
  let!(:comment5) { create(:comment, post: post1, user: user6, text: 'Comment on post 1 by Joe') }
  let!(:comment6) { create(:comment, post: post1, user: user7, text: 'Comment on post 1 by Jenny') }
  let!(:comment7) { create(:comment, post: post2, user: user1, text: 'Comment on post 2 by Lilly') }

  # likes
  let!(:like1) { create(:like, post: post1, user: user1) }
  let!(:like2) { create(:like, post: post1, user: user2) }
  let!(:like3) { create(:like, post: post2, user: user1) }
  
  scenario "Users page to a user page then to that user's posts then to individual posts" do
    visit users_path

    # users index
    expect(page).to have_selector('.user-photo img', count: 7)
    expect(page).to have_selector('.name', count: 7)
    expect(page).to have_selector('.posts-counter', count: 7)

    find("a[href='#{user_path(user1)}']").click
    # user show
    expect(current_path).to eq(user_path(user1))
    expect(page).to have_selector('.user-photo img', count: 1)
    expect(page).to have_content('Lilly')
    expect(page).to have_content('Number of posts: 4')
    expect(page).to have_content('teacher')
    expect(page).to have_content('This is Post 5')
    expect(page).to have_content('This is Post 4')
    expect(page).to have_content('This is Post 3')
    expect(page).not_to have_content('This is Post 2')
    expect(page).not_to have_content('This is Post 1')

    find("a[href='#{user_posts_path(user1)}']").click
    # user posts index
    expect(current_path).to eq(user_posts_path(user1))
    expect(page).to have_selector('.user-photo img', count: 1)
    expect(page).to have_content('Lilly')
    expect(page).to have_content('Number of posts: 4')
    expect(page).to have_content('Post 1')
    expect(page).to have_content('This is Post 1')
    expect(page).to have_content('Comments: 6 Likes: 2')
    expect(page).to have_content('Jane: Comment on post 1 by Jane')
    expect(page).to have_content('Jack: Comment on post 1 by Jack')
    expect(page).to have_content('Jill: Comment on post 1 by Jill')
    expect(page).to have_content('Joe: Comment on post 1 by Joe')
    expect(page).to have_content('Jenny: Comment on post 1 by Jenny')
    expect(page).not_to have_content('John: Comment on post 1 by John')
    expect(page).to have_content('Pagination')

    find("a[href='#{user_post_path(user1, post1)}']").click
    # user post show
    expect(current_path).to eq(user_post_path(user1, post1))
    expect(page).to have_content('Post 1 by Lilly')
    expect(page).to have_content('Comments: 6 Likes: 2')
    expect(page).to have_content('This is Post 1')
    expect(page).to have_content('John: Comment on post 1 by John')
    expect(page).to have_content('Jane: Comment on post 1 by Jane')
    expect(page).to have_content('Jack: Comment on post 1 by Jack')
    expect(page).to have_content('Jill: Comment on post 1 by Jill')
    expect(page).to have_content('Joe: Comment on post 1 by Joe')
    expect(page).to have_content('Jenny: Comment on post 1 by Jenny')
  end
end
