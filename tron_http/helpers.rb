module TronHttp
  module Helpers
    # Checks each variable against the given variables. If type name
    # includes a ! then it is required. If not and a variable is not
    # present then it is ignored.
    def self.validate_variables(vars_reference, vars_given)
      return {} unless vars_reference

      vars_reference.each do |name, type|
        name = name.to_sym
        required = type[-1] == '!'
        type = type[0..-2] if required

        return unless required || vars_given[name]

        validate_var_type(name, vars_given[name], type)
      end

      # Return the given variables.
      vars_given
    end

    # Validate type
    def self.validate_var_type(name, value, type)
      case type
      when 'string'
        raise "Variable #{name} must be a string." unless value.is_a?(String)
      when 'int32'
        raise "Variable #{name} must be an integer." unless value.is_a?(Integer)
      when 'int64'
        raise "Variable #{name} must be an integer." unless value.is_a?(Integer)
      when 'boolean'
        raise "Variable #{name} must be a boolean." unless [TrueClass, FalseClass].include?(value.class)
      end
    end
  end
end
