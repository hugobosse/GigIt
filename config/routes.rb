Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"

  root to: 'pages#home'

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bars, only: [:new, :create, :index, :show] do
    resources :bookings, only: [:create, :show]
  end

  resources :bookings, only: [:index, :destroy]

  get '/bookings/:id', to: 'bookings#add_review', as: 'review'
  patch '/bookings/:id', to: 'bookings#update_review'
  put '/bookings/:id', to: 'bookings#update_review'

end
