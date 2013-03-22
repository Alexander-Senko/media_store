# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

#
# Roles & relations
#

for (source, target), roles in {
	# Entity relations
	[ Medium, Description ] => %w[
	],
	[ Medium, List        ] => %w[
	],
	[ List,   Description ] => %w[
	],
	[ List,   List        ] => %w[
	],

	# User roles: specific
	[ User, Medium      ] => %w[
		creator
		editor
		author
	],
	[ User, Description ] => %w[
		creator
		editor
	],
} do
	Relation.seed source, target, roles
end
