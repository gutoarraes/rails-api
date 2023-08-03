Rails.application.routes.draw do
  namespace 'api' do
    resources :users
    resources :sessions, :only => [:create, :destroy]
  end
end
