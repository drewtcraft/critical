class RemoveParentIdFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :parent_id, :string
  end
end
