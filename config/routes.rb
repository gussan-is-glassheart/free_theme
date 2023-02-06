Rails.application.routes.draw do
# ユーザー登録・ログイン・プロフィール
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  resource :profile, only: %i[show edit update destroy]
end
