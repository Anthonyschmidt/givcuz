class AddStatusUsers < ActiveRecord::Migration
  def change
    add_column :users, :status, :boolean
    User.find_each do |user|
      user.status = 1
      user.save!
    end
  end

  def down
    remove_column :users, :status
  end
end
