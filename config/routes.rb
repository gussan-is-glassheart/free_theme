Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
# テーマボード
  resources :theme_boards, except: %i[edit] do
    collection do
      get :completed
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
end
