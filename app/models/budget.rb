# == Schema Information
#
# Table name: budgets
#
#  id                 :integer          not null, primary key
#  budget             :integer
#  budget_type        :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  business_travel_id :integer
#
class Budget < ApplicationRecord
  belongs_to(:business_travel, { :required => true, :class_name => "BusinessTravel", :foreign_key => "business_travel_id" })
  has_one(:user, { :through => :business_travel, :source => :user })
end
