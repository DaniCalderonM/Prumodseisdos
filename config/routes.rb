Rails.application.routes.draw do
  resources :psposts
 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :psusers
  devise_scope :psuser do
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
  end

  scope '/admin' do
    resources :psusers, :controller => 'psusers'
  end

  post '/applies', to: 'applies#psuser_apply', as: 'psuser_apply'
  get '/my_applies', to: 'applies#pspost_with_applies', as: 'my_applies'
  # Defines the root path route ("/")
   root "homes#index"
end
