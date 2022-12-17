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
require "test_helper"

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
