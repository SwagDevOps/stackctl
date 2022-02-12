# frozen_string_literal: true

require_relative 'lib/stack_ctl'
require 'kamaze/project'
require 'sys/proc'
require 'yaml'

Sys::Proc.progname = nil

# @formatter:off
Kamaze.project do |project|
  project.subject = StackCtl
  project.name = 'stack_ctl'
  # noinspection RubyLiteralArrayInspection
  project.tasks = [
    'cs:correct', 'cs:control',
    'cs:pre-commit',
    'doc', 'doc:watch',
    'gem', 'gem:compile',
    'misc:gitignore',
    'shell', 'sources:license',
    'test',
  ]
end.load!
# @formatter:on

task default: [:gem]

if project.path('spec').directory?
  task :spec do |_task, args|
    Rake::Task[:test].invoke(*args.to_a)
  end
end

# rubocop:disable Style/SoleNestedConditional
if Gem::Specification.find_all_by_name('simplecov').any?
  if YAML.safe_load(ENV['coverage'].to_s) == true
    autoload(:SimpleCov, 'simplecov')

    SimpleCov.start do
      add_filter 'rake/'
      add_filter 'spec/'
    end
  end
end
# rubocop:enable Style/SoleNestedConditional
