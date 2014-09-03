class AddSettingsToFollowing < ActiveRecord::Migration
  def change
  	add_column :followings, :setting, :string
  end
end
