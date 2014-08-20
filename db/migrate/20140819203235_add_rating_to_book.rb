class AddRatingToBook < ActiveRecord::Migration
  def change
  	add_column :books, :rating, :float
  end
end
