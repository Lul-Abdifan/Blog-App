class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post
  before_save :update_likes_counter

  def update_likes_counter
    post = Post.find_by(id: post_id)
    post.increment!(:likes_counter)
  end
end
