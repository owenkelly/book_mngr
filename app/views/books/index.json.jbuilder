json.array!(@books) do |book|
  json.extract! book, :id, :title, :author, :isbn, :active, :rating
  json.url book_url(book, format: :json)
end
