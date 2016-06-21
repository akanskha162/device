Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  get 'example/show'

  # get 'members#log_in'

  #root 'posts#index'
 # root 'carts#index'
  get 'new' => 'orders#new'
  get 'create' => 'orders#create'
  
  devise_for :members, :controllers => {:registrations => "registrations",:sessions => "sessions", omniauth_callbacks: "omniauth_callbacks"}

  devise_scope :member do
    get 'auth/:provider/callback', to: 'sessions#omniauth_callbacks'
    get 'auth/failure', to: redirect('/')
    get 'auth/:provider/callback', to: 'omniauth_callbacks#google_oauth2'
  end
  get 'auth/:provider/callback', to: 'sessions#twitter'
  get 'auth/failure', to: redirect('/')
  

resource :example, only: [:show], controller: :example
root to: "example#show"





  get 'express_checkout' => 'orders#express_checkout'
   #get 'signout', to: 'sessions#destroy', as: 'signout,
  get 'display' => 'photos#display'
   
  post 'create' => 'profiles#create'
  get 'show' =>'profiles#show'
  patch 'update' => 'profiles#update'
  get '/show_form' => 'profiles#show_form'
  get 'like' =>'posts#like'
  get 'likes' => 'comments#likes'
  get 'total'=> 'posts#total'
  get 'load_more' => 'comments#load_more'
    # root'posts#post'
    # get 'new' => 'posts#new'
    # post 'create' => 'posts#create'
    # get 'edit'=> 'posts#edit' 
    # patch 'update' => 'posts#update'
  # get 'sessions/create'
  # get 'sessions/destroy'
  get 'download' =>'posts#download'
  
  get 'new' =>'comments#reply_new'
  post 'reply' => 'comments#reply_create'
  get 'index' => 'comments#reply_index'

 #resources :orders 
  resources :posts do
    resources :comments
    collection do
      get :search
    end
  end 

end
