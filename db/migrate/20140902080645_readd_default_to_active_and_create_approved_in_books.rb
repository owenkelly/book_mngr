class ReaddDefaultToActiveAndCreateApprovedInBooks < ActiveRecord::Migration
  def change
  	change_column_default(:books, :active, true)
  	add_column :books, :approved, :boolean, defualt: true
  end
end
