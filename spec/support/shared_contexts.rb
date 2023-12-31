RSpec.shared_context 'common_data' do
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
end
