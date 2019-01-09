$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "beehive/taxonomies/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "beehive-taxonomies"
  s.version     = Beehive::Taxonomies::VERSION
  s.authors     = ["mbajur"]
  s.email       = ["mbajur@gmail.com"]
  s.homepage    = "https://github.com/beehive-cms"
  s.summary     = "Taxonomies plugin for Beehive CMS"
  s.description = "Taxonomies plugin for Beehive CMS"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.2.1"

  s.add_development_dependency "sqlite3"
end
