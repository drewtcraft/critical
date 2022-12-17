# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  invitation_token       :string
#  invitation_created_at  :datetime
#  invitation_sent_at     :datetime
#  invitation_accepted_at :datetime
#  invitation_limit       :integer
#  invited_by_type        :string
#  invited_by_id          :bigint
#  invitations_count      :integer          default(0)

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable :confirmable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :posts
  has_many :comments

  has_many :following_relationships, class_name: 'Follow', foreign_key: 'follower_id'
  has_many :follower_relationships, class_name: 'Follow', foreign_key: 'following_id'

  # users that I am following
  has_many :following, through: :following_relationships, source: :following

  # users that are followers of ME
  has_many :followers, through: :follower_relationships, source: :follower

 def start_following(user_id)
    follower_relationships.create(following_id: user_id)
 end

  def unfollow(user_id)
    follower_relationships.find_by(following_id: user_id).destroy
  end

  def following?(user_id)
    following_ids.include?(user_id)
  end
end
