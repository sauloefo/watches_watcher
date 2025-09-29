class Make < ActiveRecord::Migration[8.0]
  def change
    change_column_null :watch_brands, :name, false
    add_index :watch_brands, :name, unique: true
  end
end
