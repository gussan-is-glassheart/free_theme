FactoryBot.define do
  factory :photo_theme do
    category factory: :category
    sequence(:target) { |n| "撮影テーマ#{n}" }

    after(:create) do |theme|
      create(:photo_theme_item, photo_theme: theme, theme_item: create(:theme_item, :a))
      create(:photo_theme_item, photo_theme: theme, theme_item: create(:theme_item, :b))
    end
  end
end
