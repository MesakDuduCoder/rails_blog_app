class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create :update_comments_count

  def update_comments_count
    post.increment!(:comments_counter)
  end
end
