# app/controllers/tenants/blog_posts_controller.rb
module Tenants
  class BlogPostsController < ApplicationController
    before_action :set_blog_post, only: %i[show edit update destroy]

    def index
      @blog_posts = BlogPost.joins(blog: :tenant).where(blogs: { tenant_id: @current_tenant.id })
    end

    def new
      @blog_post = @current_tenant.blogs.new
    end

    def create
      @blog_post = @current_tenant.blogs.new(blog_post_params)
      @blog_post.user = current_user
      if @blog_post.save
        redirect_to @blog_post, notice: 'Blog post was successfully created.'
      else
        render :new
      end
    end

    private

    def set_blog_post
      @blog_post = @current_tenant.blogs.find(params[:id])
    end

    def blog_post_params
      params.require(:blog_post).permit(:title, :content)
    end
  end
end
