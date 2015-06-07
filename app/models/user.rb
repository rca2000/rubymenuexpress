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

class User < ActiveRecord::Base
	before_save { self.name = name.downcase}
    validates :name, presence: true, length: { maximum: 100 }, uniqueness: { case_sensitive: false }
    validates :email, presence: true, length: { maximum: 50 }, :format => {:with => /\A\S+@.+\.\S+\z/}
	has_secure_password
	validates :password, length: { minimum: 6 }
end
