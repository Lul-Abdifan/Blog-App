class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :likes, foreign_key: :post_id
  has_many :comments
  before_save -> { User.find_by(id: author.id).increment!(:posts_counter) }
  after_destroy -> { User.find_by(id: author.id).decrement!(:posts_counter) }
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def five_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
