# == Schema Information
#
# Table name: expenses
#
#  id           :integer          not null, primary key
#  description  :string
#  expense      :integer
#  expense_type :string
#  invoice      :string
#  payment_type :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  trip_id      :integer
#
class Expense < ApplicationRecord
  belongs_to(:trip, { :required => true, :class_name => "Trip", :foreign_key => "trip_id" })
  has_one(:user, { :through => :trip, :source => :user })

  STATUS_CLASS = {
    :draft => "badge badge-secondary",
    :sent => "badge badge-primary",
    :paid => "badge badge-success"
}

def status_class
    STATUS_CLASS[:draft]
end

def subtotal
  4
end

def discount_calculated
  4
end

def vat_calculated
  4
end

def total
  4
end
end
