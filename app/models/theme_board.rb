class ThemeBoard < ApplicationRecord
  belongs_to :user
  belongs_to :themeable, polymorphic: true
  has_one :photo_achievement, dependent: :destroy

  scope :unachieved_boards, -> { where(complete: false) }

  def self.set_photo_theme(id, passed_user_id)
    # id(カテゴリ)があれば該当カテゴリでランダムに取得して代入
    # idがなければ全体でランダムに取得して代入
    theme = id.present? ? PhotoTheme.where(category_id: id).sample : PhotoTheme.all.sample
    theme.theme_boards.create!(user_id: passed_user_id)
  end

  def image_judgement(image, processing)
    # 該当テーマの答えを配列で取得
    items = themeable.theme_items.pluck(:subject)
    # アップロードした画像のラベルを配列で取得(API)
    labels = Vision.get_image_data(image.path)
    # labelsの中にitemsの要素がすべて含まれているか？
    if items.to_set.subset?(labels.to_set)
      image = image_resize(image)
      # processingがtrueであればタイトルを埋め込む
      image = embedding(image) if processing.present?
      # 判定が通れば画像を保存し、ステータスを更新
      PhotoAchievement.create(theme_board_id: id, content: image)
      update(complete: true)
    else
      false
    end
  end

  # お試しテーマボードの作成
  def self.trial_theme_board_create(user, trial_content)
    trial_board = PhotoTheme.find(5).theme_boards.create(user_id: user.id, complete: true)
    PhotoAchievement.create(theme_board_id: trial_board.id, content: trial_content)
  end

  # 画像リサイズ
  def image_resize(image)
    require "image_processing/mini_magick"
    ImageProcessing::MiniMagick.source(image.tempfile).resize_to_limit(1920, 1920).call
  end

  # タイトルの埋め込み処理
  def embedding(image)
    require 'mini_magick'
    base_image = MiniMagick::Image.open(image.path.to_s)
    base_image.combine_options do |config|
      config.font './app/assets/fonts/MPLUS1-SemiBold.ttf'.freeze
      config.fill '#333333'
      config.gravity 'SouthWest'
      config.undercolor "rgba(255, 255, 255, 0.5)"
      config.pointsize (base_image[:width] * 0.05).to_i
      config.draw "text 20,20 ' テーマ：#{themeable.target}を撮影しよう '"
    end
  end
end
