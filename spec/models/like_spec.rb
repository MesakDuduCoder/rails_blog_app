require 'rails_helper'

RSpec.describe Like, type: :model do
  # Add your tests for associations if needed

  it 'should update post likes counter' do
    post = FactoryBot.create(:post)
    FactoryBot.create(:like, post:)

    post.reload

    expect(post.likes_counter).to eq(1)
  end
end
