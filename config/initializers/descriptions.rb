ActiveSupport.on_load :model_class do
	include Description::Describable if
		reflections[:descriptions] and
			not Description::Describable.in? ancestors
end
