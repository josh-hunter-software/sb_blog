Rails.application.routes.draw do
  root to: "blogs#index"

  get '/blogs(.:format)', to: "blogs#index", as: :blogs
  post '/blogs(.:format)', to: "blogs#create"
  get   '/blogs/new(.:format)', to: "blogs#new", as: :new_blog
  patch '/:id(.:format)', to: 'blogs#update', as: :edit_blog
  get '/:id(.:format)', to: "blogs#show", as: :blog
  patch '/:id(.:format)', to: 'blogs#update'
  put    '/:id(.:format)', to: 'blogs#update'
  delete '/:id(.:format)', to: 'blogs#destroy'

  get   '/:blog_id/posts(.:format)', to: "posts#index", as: :blog_posts  
  post  '/:blog_id/posts(.:format)', to: "posts#create"
  get   '/:blog_id/new(.:format)', to: 'posts#new', as: :new_blog_post
  get   '/:blog_id/:id/edit(.:format)', to: 'posts#edit', as: :edit_blog_post
  get   '/:blog_id/:id(.:format)', to: 'posts#show', as: :blog_post
  patch '/:blog_id/:id(.:format)', to: 'posts#update'
  put   '/:blog_id/:id(.:format)', to: 'posts#update'
  delete '/:blog_id/:id(.:format)', to: 'posts#destroy'

  get '/:blog_id/:post_id/comments(.:format)', to: 'comments#index', as: :blog_post_comments
  post '/:blog_id/:post_id/comments(.:format)', to: 'comments#create'
  get '/:blog_id/:post_id/comments/new(.:format)', to: 'comments#new', as: :new_blog_post_comment
  get '/:blog_id/:post_id/comments/:id/edit(.:format)', to: 'comments#edit', as: :edit_blog_post_comment
  get '/:blog_id/:post_id/comments/:id(.:format)', to: 'comments#show', as: :blog_post_comment 
  patch  '/:blog_id/:post_id/comments/:id(.:format)', to: 'comments#update'
  put    '/:blog_id/:post_id/comments/:id(.:format)', to: 'comments#update'
  delete '/:blog_id/:post_id/comments/:id(.:format)', to: 'comments#destroy'

  devise_for :users

end
