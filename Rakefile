begin
  require 'bones'
rescue LoadError
  abort '### Please install the "bones" gem ###'
end

task :default => 'test:run'
task 'gem:release' => 'test:run'

Bones {
  name     'active_breadcrumbs'
  authors  'David Keener'
  email    'dkeener@keenertech.com'
  url      'http://www.keenertech.com'

  # Rails isn't needed for functionality, but the gem adds its
  # modules to various Rails modules

  depend_on  'rails', '~>3.0'
  depend_on  'bones', '~>3.8.0', :development => true
  depend_on  'bones-rspec', '~>2.0.1', :development => true
  depend_on  'rake', '0.8.7', :development => true
  depend_on  'rspec', '~> 2.7.0', :development => true
}

