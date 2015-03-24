class Product < ActiveRecord::Base
	has_many :images, as: :image_holder
	belongs_to :category
  belongs_to :business


  def delete_images
    self.images.delete_all
  end
end
