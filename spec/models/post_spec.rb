require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'should update user posts counter after creation' do
    user = FactoryBot.create(:user)
    FactoryBot.create(:post, author: user)

    user.reload

    expect(user.posts_counter).to eq(1)
  end

  it 'should return recent comments' do
    post = FactoryBot.create(:post)
    FactoryBot.create_list(:comment, 5, post:)

    recent_comments = post.recent_comments

    expect(recent_comments.length).to eq(5)
  end

  it 'should validate presence of :title' do
    post = Post.new
    post.valid?
    expect(post.errors[:title]).to include("can't be blank")
  end

  it 'should validate_length_of :title it is_at_most(250)' do
    post = Post.new(title: 'a' * 251)
    post.valid?
    expect(post.errors[:title]).to include('is too long (maximum is 250 characters)')
  end

  it 'should validate_numericality_of :comments_counter it is only_integer and is_greater_than_or_equal_to(0)' do
    post = Post.new
    post.valid?
    expect(post[:comments_counter]).to eq(0)
  end

  it 'should validate_numericality_of :likes_counter it is only_integer and is_greater_than_or_equal_to(0)' do
    post = Post.new
    post.valid?
    expect(post[:likes_counter]).to eq(0)
  end
end
