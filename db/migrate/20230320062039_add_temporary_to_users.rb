class AddTemporaryToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :temporary, :boolean, default: false, null: false
  end
end
