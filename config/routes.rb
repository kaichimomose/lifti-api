Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    member do
      get :following, :followers, :attend_experiences, :given_kudos
      post :follow
      delete :unfollow
    end
  end

  resources :experiences do
      member do
          get :guests
      end
  end

  resources :follow_hosts
  resources :attendances
  resources :kudos
end
