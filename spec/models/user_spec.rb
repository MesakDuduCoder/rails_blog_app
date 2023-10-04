require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should return recent posts' do
    user = FactoryBot.create(:user)
    FactoryBot.create_list(:post, 5, author: user)

    recent_posts = user.recent_posts

    expect(recent_posts.length).to eq(3)
    expect(recent_posts).to eq(user.posts.order(created_at: :desc).limit(3))
  end

  it 'should validate presence of :name' do
    user = User.new
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it 'should validate_numericality_of :posts_counter it is only_integer and is_greater_than_or_equal_to(0)' do
    user = User.new
    user.valid?
    expect(user[:posts_counter]).to eq(0)
  end
end
