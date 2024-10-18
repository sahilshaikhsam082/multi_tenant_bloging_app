class BlogPost < ApplicationRecord
  validates :title, presence: true
  belongs_to :user # author
  belongs_to :blog
  has_many :comments
  has_many :versions
  has_many :blog_post_tags
  has_many :tags, through: :blog_post_tags
end
