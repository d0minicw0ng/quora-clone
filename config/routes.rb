Quora::Application.routes.draw do
  devise_for :users
	resources :users

	resources :questions do
    get :autocomplete_topic_name, :on => :collection
		collection do
			get 'unanswered'
		end
	end

	resources :comments
  resources :topics

  resource :follow_question_relationships, :only => [:create, :destroy]
  resource :follow_user_relationships, :only => [:create, :destroy]
  resource :question_topic_relationship, :only => [:create, :destroy]
	resources :votes, :only => [:create, :destroy]

  root :to => "root#root"
end
