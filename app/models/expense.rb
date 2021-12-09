# == Schema Information
#
# Table name: expenses
#
#  id           :integer          not null, primary key
#  description  :string
#  expense      :integer
#  expense_type :string
#  payment_type :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  trip_id      :integer
#
class Expense < ApplicationRecord
  belongs_to(:trip, { :required => true, :class_name => "Trip", :foreign_key => "trip_id" })
  has_one(:user, { :through => :trip, :source => :user })
end
