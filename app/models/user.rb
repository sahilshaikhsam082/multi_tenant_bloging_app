class User < ApplicationRecord
has_secure_password # for password hashing

  belongs_to :tenant
  has_many :blog_posts
  has_many :comments
  has_many :user_roles
  has_many :roles, through: :user_roles
  has_many :subscriptions

  enum role: { admin: 0, author: 1, reader: 2 }

  validates :email, presence: true, uniqueness: { scope: :tenant_id }
end
