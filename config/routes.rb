Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  root 'items#index'  # ルートパスで items コントローラーの index アクションを表示する
  resources :items, only: [:new, :create]  # items コントローラーへのルーティング
end
