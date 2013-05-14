class MediumDecorator < MediaStore::ModelDecorator
	def name
		filename = model.filename and
			File.basename(filename, File.extname(filename)).humanize
	end

	for method_name in TranslatableDescriptions.editable_attributes do
		-> (method_name) {
			define_method method_name do
				model.send method_name or
					name
			end
		}.(method_name)
	end

	alias_method :headline, :title
	alias_method :caption,  :abstract

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
