class AddNpoReferenceToUserTable < ActiveRecord::Migration
  def change
    add_column :users, :npo_id, :integer
  end
end
