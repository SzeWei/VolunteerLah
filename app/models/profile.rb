class Profile < ApplicationRecord
	belongs_to :user
	validates :name, presence: true
	validates :state, presence: true
	validates :city, presence:true
	validates :phone, presence: true 
end
