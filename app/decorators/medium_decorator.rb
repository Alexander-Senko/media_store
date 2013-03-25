class MediumDecorator < MediaStore::ModelDecorator
	def name
		filename = model.filename and
			File.basename(filename, File.extname(filename)).humanize
	end

	alias_method :title,    :name
	alias_method :headline, :name
	alias_method :caption,  :name

	def as_json options = {}
		model.as_json({
			except: [
				:filename,
				:metadata,
			],

			include: [
				*I18n.available_locales.map { |lang|
					:"description_#{lang}"
				}
			],
		}.merge options)
	end
end
