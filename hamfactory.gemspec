$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "hamfactory/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "hamfactory"
  s.version     = Hamfactory::VERSION
  s.authors     = ["KHamilton177"]
  s.email       = ["kerry.hamilton177@gmail.com"]
  s.homepage    = "https://github.com/khamilton177/hamfactory.git"
  s.summary     = "Hamfactory is a reusable custom CMS engine."
  s.description = "CMS engine"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.4"

  s.add_development_dependency "pg"
end
