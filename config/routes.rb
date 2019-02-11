Rails.application.routes.draw do
  devise_for :admin_users
  root to: 'blog/blog_posts#index'

  namespace :admin_users do
    resources :blog_posts do
      put 'publish' => 'blog_posts#publish', on: :member
      put 'unpublish' => 'blog_posts#unpublish', on: :member
    end
  end


  scope module: 'blog' do
    get '' => 'blog_posts#index', as: :blog_posts
    get ':id' => 'blog_posts#show', as: :blog_post
  end

end

