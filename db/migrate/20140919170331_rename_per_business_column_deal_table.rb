class RenamePerBusinessColumnDealTable < ActiveRecord::Migration
  def change
    rename_column :deals, :per_bussiness, :per_business
  end
end
