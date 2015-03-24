class Image < ActiveRecord::Base
	belongs_to :image_holder, polymorphic: true
end
