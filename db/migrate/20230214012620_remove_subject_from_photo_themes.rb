class RemoveSubjectFromPhotoThemes < ActiveRecord::Migration[7.0]
  def change
    remove_column :photo_themes, :subject, :string
  end
end
