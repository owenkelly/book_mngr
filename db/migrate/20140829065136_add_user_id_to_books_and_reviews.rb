class AddUserIdToBooksAndReviews < ActiveRecord::Migration
  def change
  	add_column :books, :user_id, :integer
  	add_column :reviews, :user_id, :integer
  end
end
