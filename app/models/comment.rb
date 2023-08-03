class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post
  before_save :update_comments_counter
  after_destroy -> { Post.find_by(id: post_id).decrement!(:comments_counter) }
  validates :text, presence: true, length: { maximum: 250 }
  def update_comments_counter
    post.increment!(:comments_counter)
  end
end
