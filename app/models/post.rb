class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'

  def update_user_posts_count
    author.increment!(:posts_counter)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
