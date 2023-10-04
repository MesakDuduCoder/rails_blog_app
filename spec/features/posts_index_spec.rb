# spec/features/post_index_spec.rb
require 'rails_helper'
RSpec.feature 'Posts show', type: :feature do
  include_context 'common_data'
  scenario 'user is on posts page' do
    visit user_posts_path(user1)
    expect(page).to have_selector('.user-photo img', count: 1)
    expect(page).to have_content('Lilly') and have_content('Number of posts: 4')
    expect(page).to have_content('Post 1') and have_content('This is Post 1') and have_content('Comments: 6 Likes: 1')
    expect(page).not_to have_content('John: This is 1st comment')
    expect(page).to have_content('John: This is 2nd comment') and have_content('John: This is 3rd comment')
    expect(page).to have_content('Chloe: This is 4th comment') and have_content('Chloe: This is 5th comment')
    expect(page).to have_content('Chloe: This is 6th comment') and have_content('Lilly: This is 7th comment')
    expect(page).to have_content('Pagination') 
    find("a[href='#{user_post_path(user1, post1)}']").click
    expect(current_path).to eq(user_post_path(user1, post1))
  end
end