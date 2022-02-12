# frozen_string_literal: true

# Copyright (C) 2019-2020 Dimitri Arrigoni <dimitri@arrigoni.me>
# License GPLv3+: GNU GPL version 3 or later
# <http://www.gnu.org/licenses/gpl.html>.
# This is free software: you are free to change and redistribute it.
# There is NO WARRANTY, to the extent permitted by law.

require_relative '../stack_ctl'
require 'dry-container'

# A a simple, thread-safe container.
#
# Intended to be one half of a dependency injection system,
# in combination with ``dry-auto_inject``.
#
# @see StackCtl::Injectable
# @see https://dry-rb.org/gems/dry-container/0.8/
# @see https://dry-rb.org/gems/dry-auto_inject/0.6/
class StackCtl::Container < ::Dry::Container
  def register(key, contents = nil, options = {}, &block)
    if self.key?(key)
      ::Dry::Container.new.tap do |container|
        container.register(key, contents, options, &block)

        return self.merge(container)
      end
    end

    super
  end

  alias_method '[]=', 'register'
end
