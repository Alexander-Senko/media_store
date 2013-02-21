require_dependency 'media_store/application_controller'

module MediaStore
	class APIController < ApplicationController
		inherit_resources

		respond_to :html, :xml, :json

		load_and_authorize_resource :except => :index # see #collection

		# Pagination
		has_scope :page, :default => 1
		has_scope :per

		# TODO: move out
		def self.inherited child
			super
			child.resource_class = nil
			child.send :initialize_resources_class_accessors!
			child.send :create_resources_url_helpers!
		end

		protected

		def collection
			get_collection_ivar || set_collection_ivar(
				end_of_association_chain.accessible_by(
					current_ability, action_name
				)
			)
		end

		def end_of_association_chain
			apply_scopes super
		end
	end
end
