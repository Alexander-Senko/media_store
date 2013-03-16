module MediaStore
	class Engine < ::Rails::Engine
		isolate_namespace MediaStore

		def self.mounted_at
			Rails.application.routes.routes.find do |route|
				route.app == self
			end.try :path
		end

		def self.recognize_path path, environment = {}
			routes.recognize_path path.sub(Regexp.new(mounted_at.try(:source).to_s), ''), environment
		end
	end
end
