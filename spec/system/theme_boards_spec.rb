require 'rails_helper'

RSpec.describe "ThemeBoards", type: :system do
  let(:user) { create(:user) }
  let!(:category) { create(:category) }
  let!(:photo_theme) { create(:photo_theme, category: category) }

  before { login_as(user) }

  describe 'テーマボード' do
    context 'テーマを選択して作成' do
      it '作成が成功する' do
        click_link I18n.t('theme_boards.new.title')
        expect(page).to have_content category.name
        click_button category.name
        expect(page).to have_content I18n.t('theme_boards.create.success')
        expect(page).to have_content "#{photo_theme.target}を撮影しよう"
      end
    end
  end
end
