class ThemeItem < ApplicationRecord
  has_many :photo_theme_items, dependent: :destroy
  has_many :photo_themes, through: :photo_theme_items

  validates :subject, presence: true
end
