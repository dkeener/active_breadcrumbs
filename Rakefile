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

  depend_on  'rspec', '~> 2.7.0', :development => true
}

