class Category < ApplicationRecord
  has_many :photo_themes, dependent: :nullify

  validates :name, presence: true
end
