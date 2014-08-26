class AddDefaultToBookRating < ActiveRecord::Migration
  def change
  	change_column_default(:books, :rating, 0)
  end
end
