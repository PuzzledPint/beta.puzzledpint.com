# -*- encoding: utf-8 -*-
# stub: parity 2.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "parity"
  s.version = "2.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Dan Croak", "Geoff Harcourt"]
  s.date = "2016-12-15"
  s.description = "    Development/staging/production parity makes it easier for\n    those who write the code to deploy the code.\n"
  s.email = ["dan@thoughtbot.com"]
  s.executables = ["development", "staging", "production"]
  s.files = ["bin/development", "bin/production", "bin/staging"]
  s.homepage = "https://github.com/thoughtbot/parity"
  s.licenses = ["MIT"]
  s.required_ruby_version = Gem::Requirement.new(">= 2.2.0")
  s.rubygems_version = "2.5.1"
  s.summary = "Shell commands for development, staging, and production parity."

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version
end
