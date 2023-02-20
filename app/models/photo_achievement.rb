class PhotoAchievement < ApplicationRecord
  belongs_to :theme_board

  validates :content, presence: true

  mount_uploader :content, ContentUploader
end
