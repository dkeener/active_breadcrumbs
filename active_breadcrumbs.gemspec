# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "active_breadcrumbs"
  s.version = "0.6.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["David Keener"]
  s.date = "2012-08-06"
  s.description = "This gem makes it easy to generate breadcrumb trails in a Rails application.\nThe emphasis is on \"structural\" breadcrumbs, where a breadcrumb trail reflects\nthe logical structure of a web site (as opposed to a \"dynamic\" trail, which\nreflects where the user has been - for which I humbbly suggest the user take\nadvantage of the browser's Back button)."
  s.email = "dkeener@keenertech.com"
  s.extra_rdoc_files = ["History.txt"]
  s.files = [".bnsignore", ".gitignore", ".project", "Gemfile", "History.txt", "README.md", "Rakefile", "lib/active_breadcrumbs.rb", "lib/active_breadcrumbs/breadcrumbs.rb", "spec/active_breadcrumbs_spec.rb", "spec/spec_helper.rb", "test/test_active_breadcrumbs.rb", "version.txt"]
  s.homepage = "http://www.keenertech.com"
  s.rdoc_options = ["--main", "README.md"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "active_breadcrumbs"
  s.rubygems_version = "1.8.16"
  s.summary = "This gem makes it easy to generate breadcrumb trails in a Rails application."
  s.test_files = ["test/test_active_breadcrumbs.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, ["~> 3.0"])
      s.add_development_dependency(%q<bones>, ["~> 3.8.0"])
      s.add_development_dependency(%q<bones-rspec>, ["~> 2.0.1"])
      s.add_development_dependency(%q<rake>, ["= 0.8.7"])
      s.add_development_dependency(%q<rspec>, ["~> 2.7.0"])
      s.add_development_dependency(%q<bones>, [">= 3.8.0"])
    else
      s.add_dependency(%q<rails>, ["~> 3.0"])
      s.add_dependency(%q<bones>, ["~> 3.8.0"])
      s.add_dependency(%q<bones-rspec>, ["~> 2.0.1"])
      s.add_dependency(%q<rake>, ["= 0.8.7"])
      s.add_dependency(%q<rspec>, ["~> 2.7.0"])
      s.add_dependency(%q<bones>, [">= 3.8.0"])
    end
  else
    s.add_dependency(%q<rails>, ["~> 3.0"])
    s.add_dependency(%q<bones>, ["~> 3.8.0"])
    s.add_dependency(%q<bones-rspec>, ["~> 2.0.1"])
    s.add_dependency(%q<rake>, ["= 0.8.7"])
    s.add_dependency(%q<rspec>, ["~> 2.7.0"])
    s.add_dependency(%q<bones>, [">= 3.8.0"])
  end
end
