Stm::Application.routes.draw do

  scope module: :web do
    resources :users, only: [:new, :create]

    resource :session, only: [:new, :create, :destroy]

    root to: "welcome#index"
  end

end
