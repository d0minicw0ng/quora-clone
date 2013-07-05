Quora::Application.routes.draw do
  get "activities/index"

  resource :feed do
    get 'most_recent'
    get 'top_questions'
  end

  devise_for :users
	resources :users

	resources :questions do
		collection do
			get 'unanswered'
		end
	end

	resources :comments
  resources :topics

  resource :follow_question_relationships, :only => [:create, :destroy]
  resource :follow_user_relationships, :only => [:create, :destroy]
  resource :follow_topic_relationships, :only => [:create, :destroy]
  resource :question_topic_relationships, :only => [:create, :destroy]

  resources :topics do
    member do
      get 'trending'
    end
  end

	resource :votes, :only => [:create, :destroy]

  root :to => "activities#index"
end
