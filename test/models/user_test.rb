# == Schema Information
#
# Table name: users
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  address     :string(255)
#  email       :string(255)
#  state       :integer
#  district_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  password    :string(255)
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
