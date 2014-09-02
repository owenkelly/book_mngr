class ChangeDefaultOnActiveInBooks < ActiveRecord::Migration
  def change
  	change_column_default(:books, :active, false)
  end
end
