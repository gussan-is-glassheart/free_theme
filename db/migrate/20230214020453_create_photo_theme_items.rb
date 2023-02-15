class CreatePhotoThemeItems < ActiveRecord::Migration[7.0]
  def change
    create_table :photo_theme_items do |t|
      t.references :photo_theme, null: false, foreign_key: true
      t.references :theme_item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
