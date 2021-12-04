# == Schema Information
#
# Table name: business_travels
#
#  id             :integer          not null, primary key
#  description    :string
#  end_date       :date
#  start_date     :date
#  travel_purpose :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :integer
#
class BusinessTravel < ApplicationRecord
  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })
  has_many(:trips, { :class_name => "Trip", :foreign_key => "business_travel_id", :dependent => :destroy })
  has_many(:budgets, { :class_name => "Budget", :foreign_key => "business_travel_id", :dependent => :destroy })
end
