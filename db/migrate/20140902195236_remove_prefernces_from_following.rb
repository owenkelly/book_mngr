class RemovePreferncesFromFollowing < ActiveRecord::Migration
  def change
  	remove_column :followings, :preferences
  end
end
