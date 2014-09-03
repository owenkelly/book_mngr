class AddPreferencesToFollowing < ActiveRecord::Migration
  def change
  	add_column :followings, :preferences, :string
  end
end
