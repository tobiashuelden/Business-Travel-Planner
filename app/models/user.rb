# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  company_name    :string
#  email           :string
#  name            :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  company_id      :integer
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  has_many(:business_travels, { :class_name => "BusinessTravel", :foreign_key => "user_id", :dependent => :destroy })
  has_many(:posts, { :class_name => "Post", :foreign_key => "user_id", :dependent => :destroy })
  belongs_to(:company, { :required => true, :class_name => "Company", :foreign_key => "company_id" })
  has_many(:trips, { :through => :business_travels, :source => :trips })
  has_many(:budgets, { :through => :business_travels, :source => :budgets })
  has_many(:expenses, { :through => :trips, :source => :expenses })
end
