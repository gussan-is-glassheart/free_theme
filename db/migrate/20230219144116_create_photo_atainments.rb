class CreatePhotoAtainments < ActiveRecord::Migration[7.0]
  def change
    create_table :photo_atainments do |t|
      t.belongs_to :theme_board, index: { unique: true }, null: false, foreign_key: true
      t.string :content , null: false

      t.timestamps
    end
  end
end
