class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	USER_ADMIN = "ADMIN"
	USER_DONOR = "DONOR"
	USER_BUSINESS_MANAGER = "BUSINESS_MANAGER"
	USER_NPO_MANAGER = "NPO_MANAGER"

	belongs_to :user_management, polymorphic: true
  belongs_to :npo
  belongs_to :business

end
