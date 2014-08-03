json.array!(@books) do |book|
  json.extract! book, :id, :Title, :Rating, :Active
  json.url book_url(book, format: :json)
end
