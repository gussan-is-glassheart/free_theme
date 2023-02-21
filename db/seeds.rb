# Categories
categories = [
  {id: 1, name: "建物"},
  {id: 2, name: "動物"}
]

categories.each do |category|
  Category.find_or_create_by(category)
end

# ThemeItems
theme_items = [
  {id: 1, subject: "Tower"},
  {id: 2, subject: "Bridge"},
  {id: 3, subject: "Dog"},
  {id: 4, subject: "Bird"},
  {id: 5, subject: "Rock Dove"},
  {id: 6, subject: "Temple"},
  {id: 7, subject: "Japanese Architecture"},
  {id: 8, subject: "Shrine"}
]

theme_items.each do |theme_item|
  ThemeItem.find_or_create_by(theme_item)
end

# PhotoThemes
photo_themes = [
  {id: 1, category_id: 1, target: "神社・仏閣"},
  {id: 2, category_id: 2, target: "犬"},
  {id: 3, category_id: 1, target: "タワー"},
  {id: 4, category_id: 2, target: "ハト"}
]

photo_themes.each do |photo_theme|
  PhotoTheme.find_or_create_by(photo_theme)
end

# PhotoThemeItems
photo_theme_items = [
  {id: 1, photo_theme_id: 1, theme_item_id: 6},
  {id: 2, photo_theme_id: 1, theme_item_id: 7},
  {id: 3, photo_theme_id: 1, theme_item_id: 8},
  {id: 4, photo_theme_id: 2, theme_item_id: 3},
  {id: 5, photo_theme_id: 3, theme_item_id: 1},
  {id: 6, photo_theme_id: 4, theme_item_id: 4},
  {id: 7, photo_theme_id: 4, theme_item_id: 5}
]

photo_theme_items.each do |photo_theme_item|
  PhotoThemeItem.find_or_create_by(photo_theme_item)
end