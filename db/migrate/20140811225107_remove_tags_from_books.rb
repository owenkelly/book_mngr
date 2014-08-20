class RemoveTagsFromBooks < ActiveRecord::Migration
  def change
  	remove_column :books, :tags
  end
end
