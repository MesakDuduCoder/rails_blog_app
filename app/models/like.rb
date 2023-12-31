class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create :update_likes_count

  def update_likes_count
    post.increment!(:likes_counter)
  end
end
