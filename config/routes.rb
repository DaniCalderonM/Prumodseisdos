Rails.application.routes.draw do
  resources :psposts
  # devise_for :psusers
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :psusers
  devise_scope :psuser do
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
  end

  scope '/admin' do
    resources :psusers, :controller => 'psusers'
  end
  # Defines the root path route ("/")
   root "homes#index"
end
