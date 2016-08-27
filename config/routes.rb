Rails.application.routes.draw do
  root to: "blogs#index"

  resources :blogs do 
    resources :posts do 
      resources :comments 
    end
  end
  devise_for :users

end
