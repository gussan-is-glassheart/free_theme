FactoryBot.define do
  factory :theme_item do

    trait :a do
      subject { "Bird" }
    end

    trait :b do
      subject { "Rock dove" }
    end

  end
end
