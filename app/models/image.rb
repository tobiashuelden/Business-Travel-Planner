# == Schema Information
#
# Table name: images
#
#  id         :integer          not null, primary key
#  caption    :string
#  location   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :integer
#
class Image < ApplicationRecord
  belongs_to(:post, { :required => true, :class_name => "Post", :foreign_key => "post_id" })
end
