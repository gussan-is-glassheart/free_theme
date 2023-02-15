class PhotoThemeItem < ApplicationRecord
  belongs_to :photo_theme
  belongs_to :theme_item
end
