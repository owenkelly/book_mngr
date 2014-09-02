class ChangeApprovedToDefualtFalse < ActiveRecord::Migration
  def change
  	change_column_default(:books, :approved, false)
  end
end
