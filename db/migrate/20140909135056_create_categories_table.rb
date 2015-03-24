class CreateCategoriesTable < ActiveRecord::Migration
  def change

  	# table categories creation
    create_table :categories do |t|
      t.string :name
    end

    # add category reference to products table
    add_column :products, :category_id, :integer

  end

  def down
    remove_column :products, :category_id
  end
end
