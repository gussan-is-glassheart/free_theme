FactoryBot.define do
  factory :photo_theme do
    category factory: :category
    target { "ハト" }

    after(:create) do |photo_theme|
      create(:photo_theme_item, photo_theme: photo_theme, theme_item: create(:theme_item, :a))
      create(:photo_theme_item, photo_theme: photo_theme, theme_item: create(:theme_item, :b))
    end
  end
end
