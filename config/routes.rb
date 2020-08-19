Rails.application.routes.draw do
  devise_for :users
  as :user do
    get    "signup"  => "devise/registrations#new"
    get    "signin"  => "devise/sessions#new"
    post   "signin"  => "devise/sessions#create"
    delete "signout" => "devise/sessions#destroy"
  end

  scope module: 'guest' do
    root to: '/guest/home#index'
    resources :home
  end

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
