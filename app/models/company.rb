# == Schema Information
#
# Table name: companies
#
#  id            :integer          not null, primary key
#  business_area :string
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Company < ApplicationRecord
  has_many(:users, { :class_name => "User", :foreign_key => "company_id", :dependent => :destroy })
  has_one(:chatroom, { :class_name => "Chatroom", :foreign_key => "company_id", :dependent => :destroy })
end
