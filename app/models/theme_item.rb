class ThemeItem < ApplicationRecord
  has_many :photo_theme_items
  has_many :photo_themes, through: :photo_theme_items

  validates :subject, presence: true
end
