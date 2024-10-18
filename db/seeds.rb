# db/seeds.rb

# Create tenants
tenant1 = Tenant.create!(name: 'Tenant One')
tenant2 = Tenant.create!(name: 'Tenant Two')

# Create roles
admin_role = Role.create!(name: 'Admin')
author_role = Role.create!(name: 'Author')
reader_role = Role.create!(name: 'Reader')

# Create users
user1 = User.create!(email: 'admin@tenant1.com', password: 'password', tenant: tenant1)
user1.user_roles.create!(role: admin_role, tenant: tenant1)

user2 = User.create!(email: 'author@tenant1.com', password: 'password', tenant: tenant1)
user2.user_roles.create!(role: author_role, tenant: tenant1)

user3 = User.create!(email: 'reader@tenant1.com', password: 'password', tenant: tenant1)
user3.user_roles.create!(role: reader_role, tenant: tenant1)

user4 = User.create!(email: 'admin@tenant2.com', password: 'password', tenant: tenant2)
user4.user_roles.create!(role: admin_role, tenant: tenant2)

user5 = User.create!(email: 'author@tenant2.com', password: 'password', tenant: tenant2)
user5.user_roles.create!(role: author_role, tenant: tenant2)

# Create blogs
blog1 = Blog.create!(title: 'Blog for Tenant One', tenant: tenant1)
blog2 = Blog.create!(title: 'Blog for Tenant Two', tenant: tenant2)

# Create blog posts
post1 = BlogPost.create!(title: 'First Post in Tenant One', content: 'This is the first post.', user: user2, blog_id: blog1.id,tenant_id: tenant1.id)
post2 = BlogPost.create!(title: 'Second Post in Tenant One', content: 'This is the second post.', user: user2, blog_id: blog2.id,tenant_id: tenant2.id)

post3 = BlogPost.create!(title: 'First Post in Tenant Two', content: 'This is the first post for tenant two.', user: user5, blog_id: blog2.id,tenant_id: tenant2.id)

# Create comments
Comment.create!(content: 'Great post!', user: user3, blog_post: post1)
Comment.create!(content: 'Thanks for sharing!', user: user3, blog_post: post2)

# Create versions for blog posts
Version.create!(blog_post: post1, content: 'This is the first post.', version_number: 1)
Version.create!(blog_post: post1, content: 'This is the updated first post.', version_number: 2)

# Create tags
tag1 = Tag.create!(name: 'Ruby')
tag2 = Tag.create!(name: 'Rails')

# Associate tags with blog posts
BlogPostTag.create!(blog_post: post1, tag: tag1)
BlogPostTag.create!(blog_post: post2, tag: tag2)

# Create subscriptions
Subscription.create!(user: user3, tenant: tenant1)
Subscription.create!(user: user5, tenant: tenant2)

puts "Seed data created successfully!"
