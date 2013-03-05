class Medium < ActiveRecord::Base
	attr_accessible :data

	mount_uploader :data, MediaStore::Uploader, mount_on: :filename

	serialize :metadata

	def method_missing method_name, *args
		case method_name
		when :name, :title, :headline, :caption
			self.class.send :define_method, method_name do
				filename and
					File.basename(filename, File.extname(filename)).gsub(/[_]/, ' ').titleize
			end.call
		else
			super
		end
	end
end
