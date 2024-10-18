class Tenant < ApplicationRecord
  has_many :users
  has_many :blogs
  has_many :subscriptions
end
