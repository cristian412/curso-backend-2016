Rails.application.routes.draw do
  devise_for :users, controllers:{
  	omniauth_callbacks: "users/omniauth_callbacks"
  }

  root 'main#home'
  # get 'main/home' OLD

  # 1 mandar peticion a fb
  # 2 fb retorna a nuestra app callback_url
  # 3 procesar la info de facebook
  # 4 autenticar o crear nuevo usuario

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
