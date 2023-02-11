class Category < ApplicationRecord
  has_many :photo_themes

  validates :name, presence: true
end
