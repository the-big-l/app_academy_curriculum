json.array! @guests do |guest|
  next unless (40..50).include?(guest.age)
  json.name guest.name
  json.age guest.age
  json.favorite_color guest.favorite_color
end
