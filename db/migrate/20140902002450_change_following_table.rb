class ChangeFollowingTable < ActiveRecord::Migration
  def change
  	rename_column :followings, :follower_id, :user_id
  	rename_column :followings, :followed_id, :book_id
  end
end
