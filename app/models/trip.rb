# == Schema Information
#
# Table name: trips
#
#  id                 :integer          not null, primary key
#  description        :string
#  end_b              :string
#  end_date           :datetime
#  start_a            :string
#  start_date         :datetime
#  trip_type          :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  business_travel_id :integer
#
class Trip < ApplicationRecord
  belongs_to(:business_travel, { :required => true, :class_name => "BusinessTravel", :foreign_key => "business_travel_id" })
  has_one(:expense, { :class_name => "Expense", :foreign_key => "trip_id", :dependent => :destroy })
  has_one(:user, { :through => :business_travel, :source => :user })
end
