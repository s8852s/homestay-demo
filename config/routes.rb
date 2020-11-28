Rails.application.routes.draw do
  root "posts#index"
  resources :posts do
    resources :comments, shallow: true
  end

  resource :users, controller: "registrations", only: [:create, :edit, :update] do
    get "/sign_up", action: "new"
  end

  resource :user, controller: "sessions", only: [] do
    get "/sign_in", action: "new"
    post "/sign_in", action: "create"
    delete "/sign_out", action: "destroy"
  end
end
