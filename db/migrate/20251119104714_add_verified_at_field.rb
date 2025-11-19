class AddVerifiedAtField < ActiveRecord::Migration[8.1]
  def change
    add_column :brands, :verified_at, :datetime
  end
end
