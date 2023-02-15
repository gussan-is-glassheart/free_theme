require 'rails_helper'

RSpec.describe "UserSessions", type: :system do
  let(:user) { create(:user) }

  describe 'ログイン前' do
    context 'フォームの入力値が正常' do
      it 'ログイン処理が成功する' do
        visit login_path
        fill_in 'email', with: user.email
        fill_in 'password', with: 'password'
        click_button I18n.t('defaults.login')
        expect(page).to have_content I18n.t('user_sessions.create.success')
        expect(current_path).to eq theme_boards_path
      end
    end

    context 'メールアドレスが未入力' do
      it 'ログインに失敗する' do
        visit login_path
        fill_in 'email', with: ''
        fill_in 'password', with: 'password'
        click_button I18n.t('defaults.login')
        expect(page).to have_content I18n.t('user_sessions.create.fail')
        expect(current_path).to eq login_path
      end
    end

    context 'パスワード未入力' do
      it 'ログインに失敗する' do
        visit login_path
        fill_in 'email', with: user.email
        fill_in 'password', with: ''
        click_button I18n.t('defaults.login')
        expect(page).to have_content I18n.t('user_sessions.create.fail')
        expect(current_path).to eq login_path
      end
    end

    context 'パスワード異なる' do
      it 'ログインに失敗する' do
        visit login_path
        fill_in 'email', with: user.email
        fill_in 'password', with: 'hogehoge'
        click_button I18n.t('defaults.login')
        expect(page).to have_content I18n.t('user_sessions.create.fail')
        expect(current_path).to eq login_path
      end
    end
  end

  describe 'ログイン後' do
    context 'ログアウトボタンをクリック' do
      it 'ログアウト処理が成功する' do
        login_as(user)
        click_link I18n.t('defaults.logout')
        expect(page).to have_content I18n.t('user_sessions.destroy.success')
        expect(current_path).to eq login_path
      end
    end
  end
end
