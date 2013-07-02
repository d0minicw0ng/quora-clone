Quora::Application.routes.draw do
  devise_for :users
	resources :users
	
	resources :questions
	resources :comments

  root :to => "root#root"
end
