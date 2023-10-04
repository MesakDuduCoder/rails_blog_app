# spec/features/post_show_spec.rb
require 'rails_helper'
RSpec.feature 'Users show', type: :feature do
  include_context 'common_data'
  scenario 'user is on a user page' do
    visit user_path(user1)
    expect(page).to have_selector('.user-photo img', count: 1)
    expect(page).to have_content('Lilly') and have_content('Number of posts: 4')
    expect(page).to have_content('Bio: teacher') and have_content('This is Post 3')
    expect(page).to have_content('This is Post 4') and have_content('This is Post 5')
    expect(page).not_to have_content('This is Post 2') and have_content('This is Post 1')
    expect(page).to have_content('See all posts')
    find("a[href='#{user_post_path(user1, post3)}']").click
    expect(current_path).to eq(user_post_path(user1, post3))
    visit user_path(user1)
    find("a[href='#{user_posts_path(user1)}']").click
    expect(current_path).to eq(user_posts_path(user1))
  end
end