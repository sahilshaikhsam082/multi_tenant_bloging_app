# In config/routes.rb
Rails.application.routes.draw do
  # constraints(subdomain: /.+/) do
    namespace :tenants do
      root to: 'blog_posts#index'  # Set the root route for tenants
      resources :blog_posts do
        member do
          get :version_history # Add this line
        end
      end
    end
  # end
end