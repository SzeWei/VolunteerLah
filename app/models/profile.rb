class Profile < ApplicationRecord
	belongs_to :user
	# validates :state, presence: true
	# validates :city, presence:true
	# validates :phone, presence: true 
	mount_uploader :avatar, AvatarUploader
end
