class RemovePostsFromPosts < ActiveRecord::Migration[5.0]
  def change
    remove_column :posts, :posts, :string
  end
end
