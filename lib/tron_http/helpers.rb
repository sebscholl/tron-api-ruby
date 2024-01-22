# frozen_string_literal: true

# TronHttp
module TronHttp
  # Helpers
  module Helpers
    # Checks each variable against the given variables. If type name
    # includes a ! then it is required. If not and a variable is not
    # present then it is ignored.
    def self.validate_variables(vars_reference, vars_given)
      return {} unless vars_reference

      vars_reference.each do |name, type|
        next unless type[-1] == "!" && vars_given[name.to_sym].nil?

        raise "Missing required variable #{name} of type #{type}."
      end

      vars_given
    end
  end
end
