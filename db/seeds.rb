# # Categories
# categories = [
#   {id: 1, name: "建物"},
#   {id: 2, name: "動物"},
#   {id: 3, name: "乗物"},
#   {id: 4, name: "自然"},
#   {id: 5, name: "もの"},
#   {id: 6, name: "食物"}
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
#   {id: 16, subject: "Mountain"},
#   {id: 17, subject: "Post box"},
#   {id: 18, subject: "Insect"},
#   {id: 19, subject: "Butterfly"},
#   {id: 20, subject: "Moon"},
#   {id: 21, subject: "Sky"},
#   {id: 22, subject: "Fountain"},
#   {id: 23, subject: "Bus"},
#   {id: 24, subject: "Ferris wheel"},
#   {id: 25, subject: "Aircraft"},
#   {id: 26, subject: "Manhole"},
#   {id: 27, subject: "Manhole cover"},
#   {id: 28, subject: "Vending machine"},
#   {id: 29, subject: "Telephone booth"},
#   {id: 30, subject: "Fire hydrant"},
#   {id: 31, subject: "Flag"},
#   {id: 32, subject: "Flower"},
#   {id: 33, subject: "Rainbow"},
#   {id: 34, subject: "Lighthouse"},
#   {id: 35, subject: "Fish"},
#   {id: 36, subject: "Seafood"},
#   {id: 37, subject: "Food"},
#   {id: 38, subject: "Meat"},
#   {id: 39, subject: "Noodle"},
#   {id: 40, subject: "Soup"},
#   {id: 41, subject: "Salad"},
#   {id: 42, subject: "Pizza"},
#   {id: 43, subject: "Waterfall"},
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
#   {id: 13, category_id: 4, target: "山"},
#   {id: 14, category_id: 5, target: "ポスト"},
#   {id: 15, category_id: 2, target: "蝶"},
#   {id: 16, category_id: 4, target: "月"},
#   {id: 17, category_id: 1, target: "噴水"},
#   {id: 18, category_id: 3, target: "バス"},
#   {id: 19, category_id: 3, target: "観覧車"},
#   {id: 20, category_id: 3, target: "飛行機"},
#   {id: 21, category_id: 5, target: "マンホールのふた"},
#   {id: 22, category_id: 5, target: "自販機"},
#   {id: 23, category_id: 5, target: "電話ボックス"},
#   {id: 24, category_id: 5, target: "消火栓(ポール)"},
#   {id: 25, category_id: 5, target: "旗"},
#   {id: 26, category_id: 4, target: "花"},
#   {id: 27, category_id: 4, target: "虹"},
#   {id: 28, category_id: 1, target: "灯台"},
#   {id: 29, category_id: 2, target: "魚"},
#   {id: 30, category_id: 6, target: "魚料理"},
#   {id: 31, category_id: 6, target: "肉料理"},
#   {id: 32, category_id: 6, target: "ラーメン"},
#   {id: 33, category_id: 6, target: "サラダ"},
#   {id: 34, category_id: 6, target: "ピザ"},
#   {id: 35, category_id: 4, target: "滝"},
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
#   {id: 17, photo_theme_id: 13, theme_item_id: 16},
#   {id: 18, photo_theme_id: 14, theme_item_id: 17},
#   {id: 19, photo_theme_id: 15, theme_item_id: 18},
#   {id: 20, photo_theme_id: 15, theme_item_id: 19},
#   {id: 21, photo_theme_id: 16, theme_item_id: 20},
#   {id: 22, photo_theme_id: 16, theme_item_id: 21},
#   {id: 23, photo_theme_id: 17, theme_item_id: 22},
#   {id: 24, photo_theme_id: 18, theme_item_id: 23},
#   {id: 25, photo_theme_id: 19, theme_item_id: 24},
#   {id: 26, photo_theme_id: 20, theme_item_id: 25},
#   {id: 27, photo_theme_id: 21, theme_item_id: 26},
#   {id: 28, photo_theme_id: 21, theme_item_id: 27},
#   {id: 29, photo_theme_id: 22, theme_item_id: 28},
#   {id: 30, photo_theme_id: 23, theme_item_id: 29},
#   {id: 31, photo_theme_id: 24, theme_item_id: 30},
#   {id: 32, photo_theme_id: 25, theme_item_id: 31},
#   {id: 33, photo_theme_id: 26, theme_item_id: 32},
#   {id: 34, photo_theme_id: 27, theme_item_id: 33},
#   {id: 35, photo_theme_id: 27, theme_item_id: 21},
#   {id: 36, photo_theme_id: 28, theme_item_id: 34},
#   {id: 37, photo_theme_id: 29, theme_item_id: 35},
#   {id: 38, photo_theme_id: 30, theme_item_id: 36},
#   {id: 39, photo_theme_id: 31, theme_item_id: 37},
#   {id: 40, photo_theme_id: 31, theme_item_id: 38},
#   {id: 41, photo_theme_id: 32, theme_item_id: 37},
#   {id: 42, photo_theme_id: 32, theme_item_id: 39},
#   {id: 43, photo_theme_id: 32, theme_item_id: 40},
#   {id: 44, photo_theme_id: 33, theme_item_id: 41},
#   {id: 45, photo_theme_id: 34, theme_item_id: 42},
#   {id: 46, photo_theme_id: 35, theme_item_id: 43},
# ]

# photo_theme_items.each do |photo_theme_item|
#   PhotoThemeItem.find_or_create_by(photo_theme_item)
# end