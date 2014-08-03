class AddISBNAndTagsToBooks < ActiveRecord::Migration
  def change
  	add_column :books, :ISBN, :integer
  	add_column :books, :tags, :string
  end
end
