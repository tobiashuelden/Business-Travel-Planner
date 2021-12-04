# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  content    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :integer
#
class Comment < ApplicationRecord
  belongs_to(:post, { :required => true, :class_name => "Post", :foreign_key => "post_id" })
end
