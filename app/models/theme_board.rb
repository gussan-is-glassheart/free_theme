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
end
