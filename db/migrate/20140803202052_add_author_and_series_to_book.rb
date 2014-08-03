class AddAuthorAndSeriesToBook < ActiveRecord::Migration
  def change
  	add_column :books, :author, :string
  	add_column :books, :series, :string
  end
end
