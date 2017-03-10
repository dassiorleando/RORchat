Rails.application.routes.draw do
  get 'site/index'

  devise_for :users
  resources :bookmarks
  # root to: "home#index"
  # root "bookmarks#index"
  root 'site#index'

  # mailbox folder routes
  get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
  get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent
  get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash

  # conversations
  resources :conversations do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
