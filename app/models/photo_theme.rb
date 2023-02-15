class PhotoTheme < ApplicationRecord
  belongs_to :category
  has_many :theme_boards, as: :themeable
  has_many :photo_theme_items
  has_many :theme_items, through: :photo_theme_items
  accepts_nested_attributes_for :photo_theme_items

  validates :target, presence: true
end
