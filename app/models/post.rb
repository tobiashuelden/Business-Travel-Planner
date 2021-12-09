# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  content     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  chatroom_id :integer
#  user_id     :integer
#
class Post < ApplicationRecord
  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })
  has_many(:comments, { :class_name => "Comment", :foreign_key => "post_id", :dependent => :destroy })
  belongs_to(:chatroom, { :required => true, :class_name => "Chatroom", :foreign_key => "chatroom_id" })
end
