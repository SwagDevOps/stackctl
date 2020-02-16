# frozen_string_literal: true

# Copyright (C) 2019-2020 Dimitri Arrigoni <dimitri@arrigoni.me>
# License GPLv3+: GNU GPL version 3 or later
# <http://www.gnu.org/licenses/gpl.html>.
# This is free software: you are free to change and redistribute it.
# There is NO WARRANTY, to the extent permitted by law.

require_relative('../stack_ctl')
require 'dry/container'

# Sample of use:
#
# ```ruby
# StackCtl::Container.register(:users) do
#   [
#     {
#       name: 'Mike'
#     }
#   ]
# end
#
# class UsersRepository
#   include StackCtl::Injectable
#
#   # @!attribute [r] users
#   #   @return [Array<User>]
#   inject(:users)
#
#   def find!(id)
#     users.fetch(id)
#   end
# end
#
# UsersRepository.new.find!(0).tap do |user|
#   pp(user)
# end
# # {:name=>"Mike"}
# ```
#
# @see StackCtl::Container
# @see https://dry-rb.org/gems/dry-auto_inject/0.6/
module StackCtl::Injectable
  class << self
    def included(base)
      base.extend(ClassMethods)
    end
  end

  # Class methods
  module ClassMethods
    protected

    # Inject given key.
    #
    # @return [Boolean]
    # @see https://dry-rb.org/gems/dry-auto_inject/
    def inject(*keys, strategy: :kwargs)
      # return false if self.injector == nil

      true.tap do
        keys.each do |key|
          # Produce something similar to:
          #
          # ```
          # include Import.args["users_repository"]
          # ```
          self.__send__(:include, self.injector.__send__(strategy)[key])
        end
      end
    end

    # @return [Dry::AutoInject::Builder|StackCtl::Injector]
    def injector
      # noinspection RubyYardReturnMatch
      StackCtl::Injector
    end
  end
end
