class Medium < ActiveRecord::Base
	attr_accessible :data

	mount_uploader :data, MediaStore::Uploader, mount_on: :filename

	serialize :metadata
end
