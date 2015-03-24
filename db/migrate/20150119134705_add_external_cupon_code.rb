class AddExternalCuponCode < ActiveRecord::Migration
  def change
    add_column :deals, :external_cupon_code, :string
  end

  def down
    remove_column :deals, :external_cupon_code
  end
end
