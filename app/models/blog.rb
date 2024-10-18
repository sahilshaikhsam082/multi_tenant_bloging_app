class Blog < ApplicationRecord
  belongs_to :tenant
  has_many :blog_posts
end
