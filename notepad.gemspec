$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "notepad/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "notepad"
  s.version     = Notepad::VERSION
  s.authors     = ["David Van Der Beek"]
  s.email       = ["earlynovrock@gmail.com"]
  s.homepage    = "https://github.com/dvanderbeek/notepad"
  s.summary     = "Notes for Rails models"
  s.description = "Notes for Rails models"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.2.0"

  s.add_development_dependency "sqlite3"
end
