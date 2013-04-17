Stm::Application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :stories, only: [:index, :show, :create, :update, :destroy]
    end
  end

  scope module: :web do
    resources :stories do
      scope module: :stories do
        resources :comments, only: [:edit, :create, :update, :destroy]
      end
    end
    resources :users, only: [:new, :create]

    namespace :account do
      resources :stories, only: [:index]
    end

    resource :session, only: [:new, :create, :destroy]

    root to: "welcome#index"
  end

end
