require 'rails_helper'
RSpec.feature 'User index and show', type: :feature do
  let!(:user1) { create(:user, name: 'Lilly', bio: 'teacher') }
  let!(:user2) { create(:user, name: 'John', bio: 'student') }
  let!(:user3) { create(:user, name: 'Chloe', bio: 'student') }
  let!(:post1) { create(:post, author: user1, title: 'Post 1', text: 'This is Post 1') }
  let!(:post2) { create(:post, author: user2, title: 'Post 2', text: 'This is Post 2') }
  let!(:post3) { create(:post, author: user1, title: 'Post 3', text: 'This is Post 3') }
  let!(:post4) { create(:post, author: user1, title: 'Post 4', text: 'This is Post 4') }
  let!(:post5) { create(:post, author: user1, title: 'Post 5', text: 'This is Post 5') }
  let!(:comment1) { create(:comment, post: post1, user: user2, text: 'This is 1st comment') }
  let!(:comment2) { create(:comment, post: post1, user: user2, text: 'This is 2nd comment') }
  let!(:comment3) { create(:comment, post: post1, user: user2, text: 'This is 3rd comment') }
  let!(:comment4) { create(:comment, post: post1, user: user3, text: 'This is 4th comment') }
  let!(:comment5) { create(:comment, post: post1, user: user3, text: 'This is 5th comment') }
  let!(:comment6) { create(:comment, post: post1, user: user3, text: 'This is 6th comment') }
  let!(:comment7) { create(:comment, post: post2, user: user1, text: 'This is 7th comment') }
  let!(:like1) { create(:like, post: post1, user: user2) }
  let!(:like2) { create(:like, post: post2, user: user1) }

  scenario 'User is in home page' do
    visit users_path
    expect(page).to have_selector('.user-photo img', count: 3)
    expect(page).to have_selector('.name', count: 3)
    expect(page).to have_selector('.posts-counter', count: 3)
  end

  scenario 'User goes to user details page' do
    visit users_path
    find("a[href='#{user_path(user1)}']").click
    expect(current_path).to eq(user_path(user1))
    expect(page).to have_selector('.user-photo img', count: 1)
    expect(page).to have_content('Lilly') and have_content('Number of posts: 4')
    expect(page).to have_content('Bio: teacher') and have_content('This is Post 3')
    expect(page).to have_content('This is Post 4') and have_content('This is Post 5')
    expect(page).not_to have_content('This is Post 2')
    expect(page).not_to have_content('This is Post 1')
  end

  scenario 'user click see all posts' do
    visit users_path
    find("a[href='#{user_path(user1)}']").click
    find("a[href='#{user_posts_path(user1)}']").click
    expect(current_path).to eq(user_posts_path(user1))
    expect(page).to have_selector('.user-photo img', count: 1)
    expect(page).to have_content('Lilly') and have_content('Number of posts: 4')
    expect(page).to have_content('Post 1') and have_content('This is Post 1') and have_content('Comments: 6 Likes: 1')
    expect(page).not_to have_content('John: This is 1st comment')
    expect(page).to have_content('John: This is 2nd comment') and have_content('John: This is 3rd comment')
    expect(page).to have_content('Chloe: This is 4th comment') and have_content('Chloe: This is 5th comment')
    expect(page).to have_content('Chloe: This is 6th comment') and have_content('Lilly: This is 7th comment')
  end

  
  scenario 'click single post' do
    visit users_path
    find("a[href='#{user_path(user1)}']").click
    find("a[href='#{user_posts_path(user1)}']").click
    find("a[href='#{user_post_path(user1, post1)}']").click
    expect(current_path).to eq(user_post_path(user1, post1))
    expect(page).to have_content('John: This is 1st comment')
    expect(page).to have_content('John: This is 2nd comment')
    expect(page).to have_content('John: This is 3rd comment')
    expect(page).to have_content('Chloe: This is 4th comment')
    expect(page).to have_content('Chloe: This is 5th comment')
    expect(page).to have_content('Chloe: This is 6th comment')
  end
end
