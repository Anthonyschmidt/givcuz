class CreateProductImagesTable < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :url
      t.string :image_holder_type
      t.integer :image_holder_id
  	end
  end
end
