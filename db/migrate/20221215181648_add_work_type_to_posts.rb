class AddWorkTypeToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :work_type, :string
  end
end
