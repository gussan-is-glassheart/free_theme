require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validation' do
    it "ユーザー情報が有効である" do
      user = build(:user)
      expect(user).to be_valid
      expect(user.errors).to be_empty
    end

    it "ユーザー名がなければ無効" do
      user_without_name = build(:user, name: "")
      expect(user_without_name).to be_invalid
      expect(user_without_name.errors[:name]).to eq [I18n.t('errors.messages.blank')]
    end

    it "メールアドレスがなければ無効" do
      user_without_email = build(:user, email: "")
      expect(user_without_email).to be_invalid
      expect(user_without_email.errors[:email]).to eq [I18n.t('errors.messages.blank')]
    end

    it "重複したメールアドレスは無効" do
      create(:user, email: "test@example.com")
      user_duplicate_email = build(:user, email: "test@example.com")
      user_duplicate_email.valid?
      expect(user_duplicate_email).to be_invalid
      expect(user_duplicate_email.errors[:email]).to eq [I18n.t('errors.messages.taken')]
    end

    it "パスワードがなければ無効" do
      user_without_password = build(:user, password: "")
      expect(user_without_password).to be_invalid
      expect(user_without_password.errors[:password]).to eq [I18n.t('errors.messages.too_short', count: 3)]
    end

    it "パスワード確認がなければ無効" do
      user_without_password_confirmation = build(:user, password_confirmation: "")
      expect(user_without_password_confirmation).to be_invalid
      expect(user_without_password_confirmation.errors[:password_confirmation]).to eq [I18n.t('errors.messages.confirmation', attribute: User.human_attribute_name(:password)), I18n.t('errors.messages.blank')]
    end

    it "パスワードとパスワード確認が一致しなければ無効" do
      user_with_no_match_password = build(:user, password: "password", password_confirmation: "hogehoge")
      expect(user_with_no_match_password).to be_invalid
      expect(user_with_no_match_password.errors[:password_confirmation]).to eq [I18n.t('errors.messages.confirmation', attribute: User.human_attribute_name(:password))]
    end

    it "パスワードが3文字未満であれば無効" do
      user_with_short_password = build(:user, password: "pa")
      expect(user_with_short_password).to be_invalid
      expect(user_with_short_password.errors[:password]).to eq [I18n.t('errors.messages.too_short', count: 3)]
    end
  end
end
