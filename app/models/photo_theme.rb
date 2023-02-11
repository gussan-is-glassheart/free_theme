class PhotoTheme < ApplicationRecord
  belongs_to :category
  has_many :theme_boards, as: :themeable
  serialize :subject, Array

  validates :target, presence: true
  validates :subject, presence: true
end
