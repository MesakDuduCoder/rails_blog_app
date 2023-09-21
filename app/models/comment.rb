class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_comments_count
    post.increment!(:comments_counter)
  end
end
