Rails.application.routes.draw do

  resources :posts
  resources :usuarios, as: :users, only: [:show,:update]
  resources :friendships, only: [:create,:update,:index]

  devise_for :users, controllers:{
  	omniauth_callbacks: "users/omniauth_callbacks"
  }

  post "/custom_sign_up", to: "users/omniauth_callbacks#custom_sign_up"

  authenticated :user do 
    root "main#home"
  end

  unauthenticated :user do
    root "main#unregistered"
  end

  # get 'main/home' OLD

  # 1 mandar peticion a fb
  # 2 fb retorna a nuestra app callback_url
  # 3 procesar la info de facebook
  # 4 autenticar o crear nuevo usuario

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

# resources :post
# GET /posts -> posts_controller / index
# GET /posts/new -> posts_controller / new
# POST /posts/ -> posts_controller / create
# GET /posts/:id -> posts_controller / show
# PUT/PATCH /posts/:id -> posts_controller /update
# GET /posts/:id/edit -> posts_controller / edit
# DELETE /posts/:id -> posts_controller / destroy
#
#