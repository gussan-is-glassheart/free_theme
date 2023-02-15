class CreateThemeItems < ActiveRecord::Migration[7.0]
  def change
    create_table :theme_items do |t|
      t.string :subject, null: false, unique: true

      t.timestamps
    end
  end
end
