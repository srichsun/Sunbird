Rails.application.routes.draw do
  resources :recipes, only: [:show, :new, :index, :create] do
    collection do
      get :search
      post :get_free_tacos
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
