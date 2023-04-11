# # Categories
# categories = [
#   {id: 1, name: "建物"},
#   {id: 2, name: "動物"},
#   {id: 3, name: "乗物"},
#   {id: 4, name: "自然"}
# ]

# categories.each do |category|
#   Category.find_or_create_by(category)
# end

# # ThemeItems
# theme_items = [
#   {id: 1, subject: "Tower"},
#   {id: 2, subject: "Bridge"},
#   {id: 3, subject: "Dog"},
#   {id: 4, subject: "Bird"},
#   {id: 5, subject: "Rock dove"},
#   {id: 6, subject: "Temple"},
#   {id: 7, subject: "Japanese architecture"},
#   {id: 8, subject: "Shrine"},
#   {id: 9, subject: "Cat"},
#   {id: 10, subject: "Train"},
#   {id: 11, subject: "Car"},
#   {id: 12, subject: "Sparrow"},
#   {id: 13, subject: "Ship"},
#   {id: 14, subject: "Sunset"},
#   {id: 15, subject: "Beach"},
#   {id: 16, subject: "Mountain"}
# ]

# theme_items.each do |theme_item|
#   ThemeItem.find_or_create_by(theme_item)
# end

# # PhotoThemes
# photo_themes = [
#   {id: 1, category_id: 1, target: "神社・仏閣"},
#   {id: 2, category_id: 2, target: "犬"},
#   {id: 3, category_id: 1, target: "タワー"},
#   {id: 4, category_id: 2, target: "ハト"},
#   {id: 5, category_id: 2, target: "猫"},
#   {id: 6, category_id: 3, target: "電車"},
#   {id: 7, category_id: 3, target: "車"},
#   {id: 8, category_id: 2, target: "スズメ"},
#   {id: 9, category_id: 3, target: "船"},
#   {id: 10, category_id: 1, target: "橋"},
#   {id: 11, category_id: 4, target: "夕焼け空"},
#   {id: 12, category_id: 4, target: "ビーチ"},
#   {id: 13, category_id: 4, target: "山"}
# ]

# photo_themes.each do |photo_theme|
#   PhotoTheme.find_or_create_by(photo_theme)
# end

# # PhotoThemeItems
# photo_theme_items = [
#   {id: 1, photo_theme_id: 1, theme_item_id: 6},
#   {id: 2, photo_theme_id: 1, theme_item_id: 7},
#   {id: 3, photo_theme_id: 1, theme_item_id: 8},
#   {id: 4, photo_theme_id: 2, theme_item_id: 3},
#   {id: 5, photo_theme_id: 3, theme_item_id: 1},
#   {id: 6, photo_theme_id: 4, theme_item_id: 4},
#   {id: 7, photo_theme_id: 4, theme_item_id: 5},
#   {id: 8, photo_theme_id: 5, theme_item_id: 9},
#   {id: 9, photo_theme_id: 6, theme_item_id: 10},
#   {id: 10, photo_theme_id: 7, theme_item_id: 11},
#   {id: 11, photo_theme_id: 8, theme_item_id: 4},
#   {id: 12, photo_theme_id: 8, theme_item_id: 12},
#   {id: 13, photo_theme_id: 9, theme_item_id: 13},
#   {id: 14, photo_theme_id: 10, theme_item_id: 2},
#   {id: 15, photo_theme_id: 11, theme_item_id: 14},
#   {id: 16, photo_theme_id: 12, theme_item_id: 15},
#   {id: 17, photo_theme_id: 13, theme_item_id: 16}
# ]

# photo_theme_items.each do |photo_theme_item|
#   PhotoThemeItem.find_or_create_by(photo_theme_item)
# end