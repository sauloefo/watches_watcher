class AddCountryToBrand < ActiveRecord::Migration[8.0]
  def change
    add_column :watch_brands, :country, :string
  end
end
