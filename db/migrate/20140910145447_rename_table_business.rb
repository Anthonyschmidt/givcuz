class RenameTableBusiness < ActiveRecord::Migration
  def change
    rename_table :business, :businesses
  end
end
