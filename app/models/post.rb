class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :likes
  has_many :comments

  def update_posts_counter
    author.increment!(:posts_counter)
    author.save
  end

  def five_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
