class AddUniqueIndexToFollowings < ActiveRecord::Migration
  def change
  	add_index :followings, :book_id
  	add_index :followings, :user_id
  	add_index :followings, [:user_id, :book_id], unique: true
  end
end
