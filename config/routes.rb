Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  root 'splash#index'

  resources :groups, only: [:index, :show, :new, :create] do
    member do
      delete 'delete_category'
    end
    resources :entities, only: [:new, :create]
  end
end
