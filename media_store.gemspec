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

	s.add_dependency 'rails', '~> 3.2'
	s.add_dependency 'prototype-rails'
	s.add_dependency 'carrierwave'
	s.add_dependency 'rmagick'

	s.add_development_dependency 'sqlite3'
end
