# frozen_string_literal: true

# Copyright (C) 2019-2020 Dimitri Arrigoni <dimitri@arrigoni.me>
# License GPLv3+: GNU GPL version 3 or later
# <http://www.gnu.org/licenses/gpl.html>.
# This is free software: you are free to change and redistribute it.
# There is NO WARRANTY, to the extent permitted by law.

require 'dry/container'

class StackCtl::Container
  extend Dry::Container::Mixin

  register :users do
    [
        {
            name: 'Mike'
        }
    ]
  end
end
