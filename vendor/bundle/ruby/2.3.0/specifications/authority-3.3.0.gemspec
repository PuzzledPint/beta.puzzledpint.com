# -*- encoding: utf-8 -*-
# stub: authority 3.3.0 ruby lib

Gem::Specification.new do |s|
  s.name = "authority"
  s.version = "3.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Nathan Long", "Adam Hunter"]
  s.date = "2017-02-07"
  s.description = "Authority helps you authorize actions in your Rails app. It's ORM-neutral and has very little fancy syntax; just group your models under one or more Authorizer classes and write plain Ruby methods on them."
  s.email = ["nathanmlong@gmail.com", "adamhunter@me.com"]
  s.homepage = "https://github.com/nathanl/authority"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "Authority helps you authorize actions in your Rails app using plain Ruby methods on Authorizer classes."

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, [">= 3.0.0"])
      s.add_development_dependency(%q<rake>, [">= 0.8.7"])
      s.add_development_dependency(%q<rspec>, ["~> 3.3.0"])
    else
      s.add_dependency(%q<activesupport>, [">= 3.0.0"])
      s.add_dependency(%q<rake>, [">= 0.8.7"])
      s.add_dependency(%q<rspec>, ["~> 3.3.0"])
    end
  else
    s.add_dependency(%q<activesupport>, [">= 3.0.0"])
    s.add_dependency(%q<rake>, [">= 0.8.7"])
    s.add_dependency(%q<rspec>, ["~> 3.3.0"])
  end
end
