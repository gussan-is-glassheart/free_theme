FactoryBot.define do
  factory :theme_board do
    user { nil }
    complete { false }
    association :themeable, factory: :photo_theme
  end
end
