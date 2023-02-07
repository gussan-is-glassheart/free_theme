class ThemeBoard < ApplicationRecord
  belongs_to :user
  belongs_to :themeable, polymorphic: true
end
