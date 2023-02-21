class AddIndexTargetToPhotoThemes < ActiveRecord::Migration[7.0]
  def change
    add_index :photo_themes, :target, unique: true
  end
end
