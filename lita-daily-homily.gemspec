Gem::Specification.new do |spec|
  spec.name          = "lita-daily-homily"
  spec.version       = "0.1.3"
  spec.authors       = ["Anchieta Júnior"]
  spec.email         = ["santosjr87@gmail.com"]
  spec.description   = "Homiía diária"
  spec.summary       = "Sumário"
  spec.homepage      = "http://anchietajunior.github.io"
  spec.license       = "MIT"
  spec.metadata      = { "lita_plugin_type" => "handler" }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", ">= 4.7"
  spec.add_dependency 'nokogiri'

  spec.add_development_dependency "bundler", ">= 1.3"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "rspec", ">= 3.0.0"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "coveralls"
end
