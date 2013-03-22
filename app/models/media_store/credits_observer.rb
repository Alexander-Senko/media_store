module MediaStore
	class CreditsObserver < ActiveRecord::Observer
		observe :medium, :description

		def after_create record
			user       = User.current
			user_roles = user.roles.in(record.class).pluck :name

			record.creators |= [ user ]
			record.authors  |= [ user ] if user_roles.include? 'author'
		end

		def after_update record
			record.editors |= [ User.current ]
		end
	end
end
