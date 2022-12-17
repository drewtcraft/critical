class CreatePostTags < ActiveRecord::Migration[7.0]
  def change
    create_table :post_tags do |t|
      t.bigint :post_id
      t.bigint :tag_id

      t.timestamps
    end
  end
end
