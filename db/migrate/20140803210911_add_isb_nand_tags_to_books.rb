class AddIsbNandTagsToBooks < ActiveRecord::Migration
  def change
  	add_column :books, :isbn, :integer
  	add_column :books, :tags, :string
  end
end
