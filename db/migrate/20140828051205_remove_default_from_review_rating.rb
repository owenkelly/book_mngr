class RemoveDefaultFromReviewRating < ActiveRecord::Migration
  def change
  	change_column_default(:reviews, :rating, nil)
  end
end
