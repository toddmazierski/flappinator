Gem::Specification.new('flappinator', '0.0.0') do |spec|
  spec.authors     = ['Todd Mazierski']
  spec.email       = ['todd@generalassemb.ly']
  spec.homepage    = 'https://github.com/toddmazierski/flappinator'
  spec.summary     = 'A command-line utility to help debug flapping processes, including tests.'
  spec.description = spec.summary
  spec.executables = ['flappinator']
  spec.files       = ['README.md'] + Dir['lib/**/*']

  spec.add_runtime_dependency 'ruby-progressbar'
  spec.add_runtime_dependency 'childprocess'
end
