class CreatePhotoThemes < ActiveRecord::Migration[7.0]
  def change
    create_table :photo_themes do |t|
      t.references :category, null: false, foreign_key: true
      t.string :target, null: false
      t.string :subject, null: false

      t.timestamps
    end
  end
end
