class AddManagementReferenceToUserTable < ActiveRecord::Migration
  def change
  	add_column :users, :user_management_type, :string
  	add_column :users, :user_management_id, :integer
  end
end
