class Post < ApplicationRecord
  belongs_to :user

  def update_user_posts_count
    user.update(posts_counter: user.posts.count)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
