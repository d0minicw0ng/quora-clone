Quora::Application.routes.draw do
  devise_for :users
	resources :users

	resources :questions do
		collection do
			get 'unanswered'
		end
	end

	resources :comments

  resource :follow_question_relationships, :only => [:create, :destroy]

	resources :votes, :only => [:create, :destroy]

  root :to => "root#root"
end
