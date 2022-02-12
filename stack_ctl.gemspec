# frozen_string_literal: true

# vim: ai ts=2 sts=2 et sw=2 ft=ruby
# rubocop:disable all

Gem::Specification.new do |s|
  s.name        = "stack_ctl"
  s.version     = "1.0.0"
  s.date        = "2020-02-16"
  s.summary     = "Simple docker stacks manager"
  s.description = "Manage containers stacks based on docker"

  s.licenses    = ["GPL-3.0"]
  s.authors     = ["Dimitri Arrigoni"]
  s.email       = "dimitri@arrigoni.me"
  s.homepage    = "https://github.com/SwagDevOps/stackctl"

  s.required_ruby_version = ">= 2.7.0"
  s.require_paths = ["lib"]
  s.bindir        = "bin"
  s.executables   = [
  ]
  s.files         = [
    ".yardopts",
    "README.md",
    "lib/stack_ctl.rb",
    "lib/stack_ctl/bundleable.rb",
    "lib/stack_ctl/container.rb",
    "lib/stack_ctl/injectable.rb",
    "lib/stack_ctl/version.rb",
    "lib/stack_ctl/version.yml",
  ]

  s.add_runtime_dependency("baby_erubis", ["~> 2.2"])
  s.add_runtime_dependency("dry-auto_inject", ["~> 0.7"])
  s.add_runtime_dependency("dry-container", ["~> 0.8"])
  s.add_runtime_dependency("kamaze-version", ["~> 1.0"])
  s.add_runtime_dependency("stibium-bundled", ["~> 0.0", ">= 0.0.4"])
  s.add_runtime_dependency("sys-proc", ["~> 1.1"])
end

# Local Variables:
# mode: ruby
# End:
