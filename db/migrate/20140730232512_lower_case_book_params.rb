class LowerCaseBookParams < ActiveRecord::Migration
  def change
  	rename_column :books, :Title, :title
  	rename_column :books, :Rating, :rating
  	rename_column :books, :Active, :active 
  end
end
