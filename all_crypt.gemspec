$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "all_crypt/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "all_crypt"
  s.version     = AllCrypt::VERSION
  s.authors     = ["Yagiz Nizipli"]
  s.email       = ["yagiznizipli@me.com"]
  s.homepage    = "http://yagiz.nizipli.com"
  s.summary     = "A gem that collects all basic requirements for security. "
  s.description = "A gem that collects all necessary hashing algorithms, AES and Base64 all together"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.0"

  s.add_development_dependency "sqlite3"
end
