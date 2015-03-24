class Deal < ActiveRecord::Base
	belongs_to :product
	belongs_to :npo
end
