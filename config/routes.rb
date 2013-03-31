Stm::Application.routes.draw do

  scope module: :web do
    resources :stories
    resources :users, only: [:new, :create]

    namespace :account do
      resources :stories, only: [:index]
    end

    resource :session, only: [:new, :create, :destroy]

    root to: "welcome#index"
  end

end
