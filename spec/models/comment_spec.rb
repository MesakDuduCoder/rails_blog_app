require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'should update post comments counter' do
    post = FactoryBot.create(:post)
    FactoryBot.create(:comment, post:)

    post.reload

    expect(post.comments_counter).to eq(1)
  end
end
