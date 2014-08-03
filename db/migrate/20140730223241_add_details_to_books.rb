class AddDetailsToBooks < ActiveRecord::Migration
  def change
    add_column :books, :Title, :string
    add_column :books, :Rating, :Integer
    add_column :books, :Active, :Boolean
  end
end
