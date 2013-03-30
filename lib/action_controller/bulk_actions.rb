module ActionController
	module BulkActions
		def resource
			return super unless bulk_action?

			collection
		end

		def collection
			return super unless bulk_action?

			get_collection_ivar || set_collection_ivar(
				apply_scopes(
					end_of_association_chain.accessible_by(
						current_ability, action_name
					).where id: params[:id]
				).decorate
			)
		end

		protected

		def bulk_action?
			Array === params[:id]
		end
	end
end
