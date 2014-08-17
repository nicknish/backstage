Rails.application.routes.draw do

  root 'welcome#new'
  get 'api/:s' => 'users#sclogin', defaults: {format: :json}
  
  resources :users, only: [:update, :create, :destroy]
    get 'users' => 'users#index'
    get 'users/:id' => 'users#edit', as: :edit

  resource :session, only: [:create, :destroy]

end
