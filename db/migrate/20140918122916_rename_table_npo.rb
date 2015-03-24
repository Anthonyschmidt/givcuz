class RenameTableNpo < ActiveRecord::Migration
  def change
    rename_table :NPO, :npos
  end
end
