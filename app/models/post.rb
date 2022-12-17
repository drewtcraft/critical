# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  title      :string
#  visibility :string
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  work_type  :string
#
class Post < ApplicationRecord
  VISIBILITY_OPTIONS = [:public, :artists_only, :private]
  WORK_TYPES = [:work_in_progress, :finish, :both]

  belongs_to :user
  has_many :comments
  has_many_attached :images
  has_rich_text :body

  has_many :post_tags
  has_many :tags, through: :post_tags
end
