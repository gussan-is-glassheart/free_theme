class AddIndexSubjectToThemeItems < ActiveRecord::Migration[7.0]
  def change
    add_index :theme_items, :subject, unique: true
  end
end
