class ChangeUserToAuthorInPosts < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :user_id, :author_id
    rename_table :users, :authors
  end
end
