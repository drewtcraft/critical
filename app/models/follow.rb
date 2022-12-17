# == Schema Information
#
# Table name: follows
#
#  id           :bigint           not null, primary key
#  follower_id  :bigint
#  following_id :bigint
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Follow < ApplicationRecord
  belongs_to :follower, class_name: 'User'
  belongs_to :following, class_name: 'User'
end
