class RemoveTagsAndSeriesFromBooks < ActiveRecord::Migration
  def change
  	remove_column :books, :tags, :string
  	remove_column :books, :series, :string
  end
end
