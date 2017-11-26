# -*- encoding: utf-8 -*-
# stub: devise_invitable 1.7.1 ruby lib

Gem::Specification.new do |s|
  s.name = "devise_invitable"
  s.version = "1.7.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Sergio Cambra"]
  s.date = "2017-02-17"
  s.description = "It adds support for send invitations by email (it requires to be authenticated) and accept the invitation by setting a password."
  s.email = ["sergio@entrecables.com"]
  s.homepage = "https://github.com/scambra/devise_invitable"
  s.licenses = ["MIT"]
  s.rdoc_options = ["--main", "README.rdoc", "--charset=UTF-8"]
  s.required_ruby_version = Gem::Requirement.new(">= 2.1.0")
  s.rubygems_version = "2.5.1"
  s.summary = "An invitation strategy for Devise"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, [">= 1.1.0"])
      s.add_runtime_dependency(%q<actionmailer>, [">= 4.1.0"])
      s.add_runtime_dependency(%q<devise>, [">= 4.0.0"])
    else
      s.add_dependency(%q<bundler>, [">= 1.1.0"])
      s.add_dependency(%q<actionmailer>, [">= 4.1.0"])
      s.add_dependency(%q<devise>, [">= 4.0.0"])
    end
  else
    s.add_dependency(%q<bundler>, [">= 1.1.0"])
    s.add_dependency(%q<actionmailer>, [">= 4.1.0"])
    s.add_dependency(%q<devise>, [">= 4.0.0"])
  end
end
