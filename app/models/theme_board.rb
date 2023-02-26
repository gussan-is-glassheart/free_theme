class ThemeBoard < ApplicationRecord
  belongs_to :user
  belongs_to :themeable, polymorphic: true
  has_one :photo_achievement, dependent: :destroy

  def self.set_photo_theme(id, user_id)
    # id(カテゴリ)があれば該当カテゴリでランダムに取得して代入
    # idがなければ全体でランダムに取得して代入
    theme = id.present? ? PhotoTheme.where(category_id: id).sample : PhotoTheme.all.sample
    theme.theme_boards.create!(user_id: user_id)
  end

  def self.image_judgement(theme_board, image)
    # 該当テーマの答えを配列で取得
    items = theme_board.themeable.theme_items.pluck(:subject)
    # アップロードした画像のラベルを配列で取得(API)
    labels = Vision.get_image_data(image.path)
    # labelsの中にitemsの要素がすべて含まれているか？
    items.to_set.subset?(labels.to_set) ? true : false
  end
end
