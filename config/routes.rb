Rails.application.routes.draw do
      resources :ideas, only: [:create, :index]
end
