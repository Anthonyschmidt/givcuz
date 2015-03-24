class Business < ActiveRecord::Base
  has_many :images, as: :image_holder
  has_many :products
  has_one :user, as: :user_management
end