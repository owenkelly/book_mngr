class AddDefaultToSetting < ActiveRecord::Migration
  def change
  	change_column_default(:followings, :setting, "rating_and_review")
  end
end
