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

  # MUST follow the higher required_ruby_version
  # requires version >= 2.3.0 due to safe navigation operator &
  # requires version >= 2.5.0 due to Lint/Syntax: unexpected token kRESCUE
  s.required_ruby_version = ">= 2.5.0"
  s.require_paths = ["lib"]
  s.bindir        = "bin"
  s.executables   = Dir.glob([s.bindir, "/*"].join)
                       .select { |f| File.file?(f) and File.executable?(f) }
                       .map { |f| File.basename(f) }
  s.files = [
    ".yardopts",
    s.require_paths.map { |rp| [rp, "/**/*.rb"].join },
    s.require_paths.map { |rp| [rp, "/**/*.yml"].join },
  ].flatten
   .map { |m| Dir.glob(m) }
   .flatten
   .push(*s.executables.map { |f| [s.bindir, f].join("/") })

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
