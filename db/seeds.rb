# Category
Category.create!(name: "建物")
Category.create!(name: "動物")

# ThemeItems
ThemeItem.create!(subject: "Tower")
ThemeItem.create!(subject: "Bridge")
ThemeItem.create!(subject: "Dog")
ThemeItem.create!(subject: "Bird")
ThemeItem.create!(subject: "Rock Dove")
ThemeItem.create!(subject: "Temple")
ThemeItem.create!(subject: "Japanese Architecture")
ThemeItem.create!(subject: "Shrine")

# PhotoThemes
PhotoTheme.create!(category_id: 1, target: "神社・仏閣")
PhotoTheme.create!(category_id: 2, target: "犬")
PhotoTheme.create!(category_id: 1, target: "タワー")
PhotoTheme.create!(category_id: 2, target: "ハト")

# PhotoThemeItems
PhotoThemeItem.create!(photo_theme_id: 1, theme_item_id: 6)
PhotoThemeItem.create!(photo_theme_id: 1, theme_item_id: 7)
PhotoThemeItem.create!(photo_theme_id: 1, theme_item_id: 8)
PhotoThemeItem.create!(photo_theme_id: 2, theme_item_id: 3)
PhotoThemeItem.create!(photo_theme_id: 3, theme_item_id: 1)
PhotoThemeItem.create!(photo_theme_id: 4, theme_item_id: 4)
PhotoThemeItem.create!(photo_theme_id: 4, theme_item_id: 5)