Rails.application.routes.draw do
  root 'api/users#index'
  namespace 'api' do
    resources :users
  end
end
