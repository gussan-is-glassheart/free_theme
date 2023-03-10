require 'rails_helper'

RSpec.describe "ThemeBoards", type: :system do
  let(:user) { create(:user) }
  let(:theme_board) { create(:theme_board, user: user)
  }

  before do
    login_as(user)
    @photo_theme = theme_board.themeable
    @category = @photo_theme.category
  end

  describe 'テーマボード' do
    context 'テーマを選択して作成' do
      it '作成が成功する' do
        click_link I18n.t('theme_boards.new.title')
        click_button @category.name
        expect(page).to have_content I18n.t('theme_boards.create.success')
        expect(page).to have_content "#{@photo_theme.target}を撮影しよう"
      end
    end

    context '作成したテーマを削除' do
      it '削除が成功する' do
        click_link I18n.t('theme_boards.new.title')
        click_button @category.name
        click_link I18n.t('defaults.theme_delete')
        expect(page).to have_content I18n.t('theme_boards.destroy.success')
        expect(current_path).to eq theme_boards_path
      end
    end
  end

  describe 'テーマ判定' do
    before do
      click_link I18n.t('theme_boards.index.title')
      click_link @photo_theme.target
    end
    context 'テーマのお題に準じた画像をアップロード' do
      it 'お題の判定に成功する' do
        attach_file 'theme_board_content', "#{Rails.root}/spec/fixtures/images/success_judge_image.jpg"
        click_button I18n.t('defaults.judgement')
        expect(page).to have_content I18n.t('theme_boards.update.success')
        expect(page).to have_selector("img[src$='success_judge_image.jpg']")
      end
    end

    context 'テーマのお題に準じていない画像をアップロード' do
      it 'お題の判定に失敗する' do
        attach_file 'theme_board_content', "#{Rails.root}/spec/fixtures/images/failure_judge_image.jpg"
        click_button I18n.t('defaults.judgement')
        expect(page).to have_content I18n.t('theme_boards.update.fail')
      end
    end

    context '画像をアップロードしていない' do
      it 'お題に判定に失敗する' do
        click_button I18n.t('defaults.judgement')
        expect(page).to have_content I18n.t('theme_boards.update.fail')
      end
    end
  end
end
