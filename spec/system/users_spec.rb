require 'rails_helper'

RSpec.describe "Users", type: :system do
  let(:user) { create(:user) }

  describe 'ログイン前' do
    describe 'ユーザー新規登録' do
      context 'フォームの入力値が正常' do
        it 'ユーザーの新規登録が成功する' do
          visit signup_path
          fill_in 'user[name]', with: 'テストユーザー'
          fill_in 'user[email]', with: 'test@example.com'
          fill_in 'user[password]', with: 'password'
          fill_in 'user[password_confirmation]', with: 'password'
          click_button I18n.t('defaults.register')
          expect(page).to have_content I18n.t('users.create.success')
          expect(current_path).to eq theme_boards_path
        end
      end

      context 'ユーザー名が未入力' do
        it 'ユーザーの新規登録が失敗する' do
          visit signup_path
          fill_in 'user[name]', with: ''
          fill_in 'user[email]', with: 'test@example.com'
          fill_in 'user[password]', with: 'password'
          fill_in 'user[password_confirmation]', with: 'password'
          click_button I18n.t('defaults.register')
          expect(page).to have_content I18n.t('users.create.fail')
          expect(page).to have_content User.human_attribute_name(:name) + I18n.t('errors.messages.blank')
          expect(current_path).to eq signup_path
        end
      end

      context 'メールアドレスが未入力' do
        it 'ユーザーの新規登録が失敗する' do
          visit signup_path
          fill_in 'user[name]', with: 'テストユーザー'
          fill_in 'user[email]', with: ''
          fill_in 'user[password]', with: 'password'
          fill_in 'user[password_confirmation]', with: 'password'
          click_button I18n.t('defaults.register')
          expect(page).to have_content I18n.t('users.create.fail')
          expect(page).to have_content User.human_attribute_name(:email) + I18n.t('errors.messages.blank')
          expect(current_path).to eq signup_path
        end
      end

      context '登録済みのメールアドレスを使用' do
        it 'ユーザーの新規登録が失敗する' do
          existed_user = create(:user)
          visit signup_path
          fill_in 'user[name]', with: 'テストユーザー'
          fill_in 'user[email]', with: existed_user.email
          fill_in 'user[password]', with: 'password'
          fill_in 'user[password_confirmation]', with: 'password'
          click_button I18n.t('defaults.register')
          expect(page).to have_content I18n.t('users.create.fail')
          expect(page).to have_content User.human_attribute_name(:email) + I18n.t('errors.messages.taken')
          expect(current_path).to eq signup_path
        end
      end

      context 'パスワードが未入力' do
        it 'ユーザーの新規登録が失敗する' do
          visit signup_path
          fill_in 'user[name]', with: 'テストユーザー'
          fill_in 'user[email]', with: 'test@example.com'
          fill_in 'user[password]', with: ''
          fill_in 'user[password_confirmation]', with: 'password'
          click_button I18n.t('defaults.register')
          expect(page).to have_content I18n.t('users.create.fail')
          expect(page).to have_content User.human_attribute_name(:password) + I18n.t('errors.messages.too_short', count: 3)
          expect(page).to have_content User.human_attribute_name(:password_confirmation) + I18n.t('errors.messages.confirmation', attribute: User.human_attribute_name(:password))
          expect(current_path).to eq signup_path
        end
      end

      context 'パスワード確認が未入力' do
        it 'ユーザーの新規登録が失敗する' do
          visit signup_path
          fill_in 'user[name]', with: 'テストユーザー'
          fill_in 'user[email]', with: 'test@example.com'
          fill_in 'user[password]', with: 'password'
          fill_in 'user[password_confirmation]', with: ''
          click_button I18n.t('defaults.register')
          expect(page).to have_content I18n.t('users.create.fail')
          expect(page).to have_content User.human_attribute_name(:password_confirmation) + I18n.t('errors.messages.blank')
          expect(page).to have_content User.human_attribute_name(:password_confirmation) + I18n.t('errors.messages.confirmation', attribute: User.human_attribute_name(:password))
          expect(current_path).to eq signup_path
        end
      end

      context 'パスワードとパスワード確認が一致しない' do
        it 'ユーザーの新規登録が失敗する' do
          visit signup_path
          fill_in 'user[name]', with: 'テストユーザー'
          fill_in 'user[email]', with: 'test@example.com'
          fill_in 'user[password]', with: 'password'
          fill_in 'user[password_confirmation]', with: 'hogehoge'
          click_button I18n.t('defaults.register')
          expect(page).to have_content I18n.t('users.create.fail')
          expect(page).to have_content User.human_attribute_name(:password_confirmation) + I18n.t('errors.messages.confirmation', attribute: User.human_attribute_name(:password))
          expect(current_path).to eq signup_path
        end
      end

      context 'パスワードが3文字未満' do
        it 'ユーザーの新規登録が失敗する' do
          visit signup_path
          fill_in 'user[name]', with: 'テストユーザー'
          fill_in 'user[email]', with: 'test@example.com'
          fill_in 'user[password]', with: 'pa'
          fill_in 'user[password_confirmation]', with: 'pa'
          click_button I18n.t('defaults.register')
          expect(page).to have_content I18n.t('users.create.fail')
          expect(page).to have_content User.human_attribute_name(:password) + I18n.t('errors.messages.too_short', count: 3)
          expect(current_path).to eq signup_path
        end
      end
    end

    describe 'プロフィール' do
      context 'ログインしていない状態' do
        it 'プロフィールへのアクセスが失敗する' do
          visit profile_path(user)
          expect(page).to have_content I18n.t('defaults.please_login')
          expect(current_path).to eq login_path
        end
      end
    end
  end

  describe 'ログイン後' do
    before do
      login_as(user)
      click_link I18n.t('profiles.show.title')
    end

    describe 'プロフィール変更' do
      context 'フォームの入力値が正常' do
        it 'プロフィール変更が成功する' do
          click_link I18n.t('defaults.edit')
          fill_in 'user[name]', with: 'new_test_user'
          click_button I18n.t('defaults.edit')
          expect(page).to have_content I18n.t('profiles.update.success')
          expect(page).to have_content 'new_test_user'
          expect(current_path).to eq profile_path
        end
      end

      context 'ユーザー名が未入力' do
        it 'プロフィールの変更が失敗する' do
          click_link I18n.t('defaults.edit')
          fill_in 'user[name]', with: ''
          click_button I18n.t('defaults.edit')
          expect(page).to have_content I18n.t('profiles.update.fail')
          expect(page).to have_content User.human_attribute_name(:name) + I18n.t('errors.messages.blank')
          expect(current_path).to eq edit_profile_path
        end
      end
    end

    describe 'ユーザー削除' do
      context 'ユーザー削除のボタンをクリック' do
        it 'ユーザーが正常に削除される' do
          click_link I18n.t('defaults.user_delete')
          expect(page.accept_confirm).to eq I18n.t('defaults.user_delete_confirmation')
          expect(page).to have_content I18n.t('profiles.destroy.success')
          expect(current_path).to eq root_path
        end
      end
    end
  end
end
