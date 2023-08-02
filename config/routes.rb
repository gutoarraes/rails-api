Rails.application.routes.draw do
  root 'users#index'
  namespace 'api' do
    resources :users
    resources :sessions, :only => [:create, :destroy]
  end
end
