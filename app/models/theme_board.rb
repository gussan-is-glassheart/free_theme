class ThemeBoard < ApplicationRecord
  belongs_to :user
  belongs_to :themeable, polymorphic: true
  has_one :photo_achievement, dependent: :destroy

  scope :unachieved_boards, -> { where(complete: false) }

  def self.set_photo_theme(id, user_id)
    # id(カテゴリ)があれば該当カテゴリでランダムに取得して代入
    # idがなければ全体でランダムに取得して代入
    theme = id.present? ? PhotoTheme.where(category_id: id).sample : PhotoTheme.all.sample
    theme.theme_boards.create!(user_id: user_id)
  end

  def image_judgement(image)
    # 該当テーマの答えを配列で取得
    items = themeable.theme_items.pluck(:subject)
    # アップロードした画像のラベルを配列で取得(API)
    labels = Vision.get_image_data(image.path)
    # labelsの中にitemsの要素がすべて含まれているか？
    if items.to_set.subset?(labels.to_set)
      # 判定が通れば画像を保存し、ステータスを更新
      PhotoAchievement.create(theme_board_id: self.id, content: image)
      self.update(complete: true)
    else
      false
    end
  end

  # お試しテーマボードの作成
  def self.trial_theme_board_create(user, content)
    trial_board = PhotoTheme.find(5).theme_boards.create(user_id: user.id, complete: true)
    PhotoAchievement.create(theme_board_id: trial_board.id, content: content)
  end
end
