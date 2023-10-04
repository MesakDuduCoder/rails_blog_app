# spec/features/user_show_spec.rb
require 'rails_helper'
RSpec.feature 'Posts index', type: :feature do
  include_context 'common_data'
  scenario 'user is on a post page' do
    visit user_post_path(user1, post1)
    expect(page).to have_content('Post 1 by Lilly')
    expect(page).to have_content('Comments: 6 Likes: 1')
    expect(page).to have_content('This is Post 1')
    expect(page).to have_content('John: This is 1st comment')
    expect(page).to have_content('John: This is 2nd comment')
    expect(page).to have_content('John: This is 3rd comment')
    expect(page).to have_content('Chloe: This is 4th comment')
    expect(page).to have_content('Chloe: This is 5th comment')
    expect(page).to have_content('Chloe: This is 6th comment')
  end
end
