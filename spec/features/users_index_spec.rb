# spec/features/post_index_spec.rb
require 'rails_helper'
RSpec.feature 'Users index', type: :feature do
  include_context 'common_data'
  scenario 'user is on users or home page' do
    visit users_path
    expect(page).to have_selector('.user-photo img', count: 3)
    expect(page).to have_selector('.name', count: 3)
    expect(page).to have_selector('.posts-counter', count: 3)
    find("a[href='#{user_path(user1)}']").click
    expect(current_path).to eq(user_path(user1))
  end
end