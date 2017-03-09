json.partial! "api/shared/guest"
json.gifts do
  json.array! @guest.gifts, :title, :description
end
