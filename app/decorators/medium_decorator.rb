class MediumDecorator < MediaStore::ModelDecorator
	def name
		filename = model.filename and
			File.basename(filename, File.extname(filename)).humanize
	end

	alias_method :title,    :name
	alias_method :headline, :name
	alias_method :caption,  :name
end
