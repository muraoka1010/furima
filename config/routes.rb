Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'items#index'  # ルートパスで items コントローラーの index アクションを表示する
  resources :items  # items コントローラーへのルーティング
end
