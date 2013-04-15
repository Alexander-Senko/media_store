$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'media_store/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
	s.name        = 'media_store'
	s.version     = MediaStore::VERSION
	s.authors     = [ 'Alexander Senko' ]
	s.email       = [ 'Alexander.Senko@gmail.com' ]
#	s.homepage    = 'TODO'
	s.summary     = 'Rails Engine for maintaining media collections.'
#	s.description = 'TODO: Description of MediaStore.'

	s.files = Dir['{app,config,db,lib}/**/*'] + ['MIT-LICENSE', 'Rakefile', 'README.rdoc']

	s.add_dependency 'rails', '~> 4.0.0.beta'
	s.add_dependency 'rails-observers'
	s.add_dependency 'carrierwave'
	s.add_dependency 'rmagick'
	s.add_dependency 'inherited_resources'
	s.add_dependency 'kaminari'
	s.add_dependency 'cancan'
	s.add_dependency 'haml'
	s.add_dependency 'shared_form-rails'
	s.add_dependency 'draper', '~> 1.1.0'

	s.add_development_dependency 'sqlite3'
end
