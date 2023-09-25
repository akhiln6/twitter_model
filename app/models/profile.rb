class Profile < ApplicationRecord
	belongs_to :user, foreign_key: "user_id"

	validates_length_of :mobilenumber, :minimum => 10, :maximum => 10 

	mount_uploader :profile_image, ProfileImageUploader
end
