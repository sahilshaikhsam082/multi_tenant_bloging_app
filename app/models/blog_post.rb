class BlogPost < ApplicationRecord
  validates :title, presence: true
  belongs_to :user # author
  belongs_to :blog
  has_many :comments
  has_many :versions
  has_many :blog_post_tags
  has_many :tags, through: :blog_post_tags
  after_save :create_version

  private

  def create_version
    versions.create(content: content, user: user) if content_changed?
  end
end
