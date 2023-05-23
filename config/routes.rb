Rails.application.routes.draw do
  root to: 'lists#home'
  resources :lists do
    resources :bookmarks, only: [:new, :create]
  end

  resources :bookmarks, only: :destroy
  resources :lists, only: :destroy
end
