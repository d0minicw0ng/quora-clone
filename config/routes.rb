Quora::Application.routes.draw do
  devise_for :users
	resources :users

  root :to => "root#root"
end
