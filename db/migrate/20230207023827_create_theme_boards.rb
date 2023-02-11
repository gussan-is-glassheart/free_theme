class CreateThemeBoards < ActiveRecord::Migration[7.0]
  def change
    create_table :theme_boards do |t|
      t.references :user, null: false, foreign_key: true
      t.boolean :complete, null: false, default: false
      t.integer :themeable_id
      t.string :themeable_type

      t.timestamps
    end

    add_index :theme_boards, [:themeable_type, :themeable_id]
  end
end
