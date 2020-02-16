# frozen_string_literal: true

# Copyright (C) 2019-2020 Dimitri Arrigoni <dimitri@arrigoni.me>
# License GPLv3+: GNU GPL version 3 or later
# <http://www.gnu.org/licenses/gpl.html>.
# This is free software: you are free to change and redistribute it.
# There is NO WARRANTY, to the extent permitted by law.

$LOAD_PATH.unshift(__dir__)

# Base module (namespace)
module StackCtl
  # @formatter:off
  {
    VERSION: 'version',
    Bundled: 'bundled',
    Container: 'container',
    Injectable: 'injectable',
  }.each { |s, fp| autoload(s, "#{__dir__}/stack_ctl/#{fp}") }
  # @formatter:on

  include(Bundled).tap do
    require 'bundler/setup' if bundled?
    require 'kamaze/project/core_ext/pp' if development?
  end

  require('dry/auto_inject').tap do
    # noinspection RubyConstantNamingConvention
    Injector = Dry::AutoInject(StackCtl::Container)
  end
end
