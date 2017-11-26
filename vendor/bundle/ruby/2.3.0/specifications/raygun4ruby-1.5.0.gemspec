# -*- encoding: utf-8 -*-
# stub: raygun4ruby 1.5.0 ruby lib

Gem::Specification.new do |s|
  s.name = "raygun4ruby"
  s.version = "1.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Mindscape", "Nik Wakelin"]
  s.date = "2017-03-15"
  s.description = "Ruby Adapter for Raygun.io"
  s.email = ["hello@raygun.io"]
  s.homepage = "http://raygun.io"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "This gem provides support for Ruby and Ruby on Rails for the Raygun.io error reporter"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<httparty>, ["> 0.13.7"])
      s.add_runtime_dependency(%q<json>, [">= 0"])
      s.add_runtime_dependency(%q<rack>, [">= 0"])
      s.add_development_dependency(%q<bundler>, [">= 1.1"])
      s.add_development_dependency(%q<rake>, ["= 0.9.6"])
      s.add_development_dependency(%q<fakeweb>, ["~> 1.3"])
      s.add_development_dependency(%q<timecop>, [">= 0"])
      s.add_development_dependency(%q<minitest>, ["~> 4.2"])
      s.add_development_dependency(%q<redis-namespace>, [">= 1.3.1"])
      s.add_development_dependency(%q<resque>, [">= 0"])
      s.add_development_dependency(%q<sidekiq>, ["< 3.2.2", ">= 3"])
      s.add_development_dependency(%q<mocha>, [">= 0"])
      s.add_development_dependency(%q<pry>, [">= 0"])
    else
      s.add_dependency(%q<httparty>, ["> 0.13.7"])
      s.add_dependency(%q<json>, [">= 0"])
      s.add_dependency(%q<rack>, [">= 0"])
      s.add_dependency(%q<bundler>, [">= 1.1"])
      s.add_dependency(%q<rake>, ["= 0.9.6"])
      s.add_dependency(%q<fakeweb>, ["~> 1.3"])
      s.add_dependency(%q<timecop>, [">= 0"])
      s.add_dependency(%q<minitest>, ["~> 4.2"])
      s.add_dependency(%q<redis-namespace>, [">= 1.3.1"])
      s.add_dependency(%q<resque>, [">= 0"])
      s.add_dependency(%q<sidekiq>, ["< 3.2.2", ">= 3"])
      s.add_dependency(%q<mocha>, [">= 0"])
      s.add_dependency(%q<pry>, [">= 0"])
    end
  else
    s.add_dependency(%q<httparty>, ["> 0.13.7"])
    s.add_dependency(%q<json>, [">= 0"])
    s.add_dependency(%q<rack>, [">= 0"])
    s.add_dependency(%q<bundler>, [">= 1.1"])
    s.add_dependency(%q<rake>, ["= 0.9.6"])
    s.add_dependency(%q<fakeweb>, ["~> 1.3"])
    s.add_dependency(%q<timecop>, [">= 0"])
    s.add_dependency(%q<minitest>, ["~> 4.2"])
    s.add_dependency(%q<redis-namespace>, [">= 1.3.1"])
    s.add_dependency(%q<resque>, [">= 0"])
    s.add_dependency(%q<sidekiq>, ["< 3.2.2", ">= 3"])
    s.add_dependency(%q<mocha>, [">= 0"])
    s.add_dependency(%q<pry>, [">= 0"])
  end
end
