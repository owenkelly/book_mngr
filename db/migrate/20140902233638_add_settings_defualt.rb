class AddSettingsDefualt < ActiveRecord::Migration
  def change
  	change_column_default(:followings, :settings, "rating_and_review")
  end
end
