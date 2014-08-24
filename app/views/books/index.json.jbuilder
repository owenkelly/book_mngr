json.array!(@books) do |book|
  json.extract! book, :id, :title, :author, :isbn, :series, :active
  json.url book_url(book, format: :json)
end
