class RenamePostStatusToVisibility < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :status, :visibility
  end
end
