Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :theme_items
    resources :theme_boards
    resources :photo_theme_items
    resources :photo_themes
    resources :photo_achievements
    resources :categories

    root to: "users#index"
  end
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  # テーマボード
  resources :theme_boards, except: %i[edit] do
    collection do
      get :completed
    end
    member do
      get :download
    end
  end

  # お試し
  get 'trial', to: 'trials#show'
  post 'trial', to: 'trials#update'

  # 静的ページ
  root 'static_pages#top'
  get 'terms', to: 'static_pages#terms'
  get 'privacy_policy', to: 'static_pages#privacy_policy'

  # ユーザー登録・ログイン・プロフィール
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  resource :profile, only: %i[show edit update destroy]
  resources :password_resets, only: %i[new create edit update]

  # 404ページ
  get '*path', to: 'application#render_404'
end
