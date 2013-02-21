module MediaStore
	# To be included in descendants of CarrierWave::Uploader::Base
	module Storage
		extend ActiveSupport::Concern

		included do
			# Choose what kind of storage to use for this uploader:
			storage :file # or :fog

			cattr_accessor :items_in_store, :nodes_in_dir

			@@items_in_store = 1_000_000
			@@nodes_in_dir   = 1_000
		end

		# Override the directory where uploaded files will be stored.
		# This is a sensible default for uploaders that are meant to be mounted:
		def store_dir
			"#{model.class.name.pluralize.underscore}/#{version_name || :original}/#{path_partitions*'/'}"
		end

		def full_filename filename
			full_id + File.extname(filename)
		end

		def cache_dir
			Rails.root.join 'tmp/cache/uploads'
		end

		private

		def full_id
			model.id.to_s.rjust digits_in_id, '0'
		end

		def path_partitions
			full_id.match(
				/#{'('*number_of_path_partitions}#{"#{'.'*digits_in_path_partition})"*number_of_path_partitions}/
			).captures.reverse
		end

		def digits_in_id
			Math.log10(items_in_store).ceil
		end

		def digits_in_path_partition
			Math.log10(nodes_in_dir).ceil
		end

		def number_of_path_partitions
			digits_in_id / digits_in_path_partition - 1
		end
	end
end
