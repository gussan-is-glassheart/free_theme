class ThemeBoard < ApplicationRecord
  belongs_to :user
  belongs_to :themeable, polymorphic: true

  def set_photo_theme(id)
    if self.id.present?
      PhotoTheme.where(category_id: id).sample
    else
      PhotoTheme.all.sample
    end
  end
end
