class AddLinkExternalCode < ActiveRecord::Migration
  def change
    add_column :deals, :link_external_code, :string
  end

  def down
    remove_column :deals, :link_external_code
  end
end
