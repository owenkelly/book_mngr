class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :Title
      t.integer :Rating
      t.boolean :Active, :default => true

      t.timestamps
    end
  end
end
