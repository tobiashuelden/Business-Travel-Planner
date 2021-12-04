# == Schema Information
#
# Table name: chatrooms
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :integer
#
class Chatroom < ApplicationRecord
  belongs_to(:company, { :class_name => "Company", :foreign_key => "company_id" })
  has_many(:posts, { :class_name => "Post", :foreign_key => "chatroom_id", :dependent => :destroy })
end
