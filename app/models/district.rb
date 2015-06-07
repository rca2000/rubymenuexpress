# == Schema Information
#
# Table name: districts
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  state      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class District < ActiveRecord::Base
end
