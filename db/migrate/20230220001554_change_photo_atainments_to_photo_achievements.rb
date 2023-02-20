class ChangePhotoAtainmentsToPhotoAchievements < ActiveRecord::Migration[7.0]
  def change
    rename_table :photo_atainments, :photo_achievements
  end
end
