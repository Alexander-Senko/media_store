# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

#
# Roles & relations
#

for (source, target), roles in {
	# Entity relations
	[ Medium, Description ] => %w[
	],
} do
	Relation.seed source, target, roles
end
