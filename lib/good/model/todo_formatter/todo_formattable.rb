# frozen_string_literal: true

require_relative 'formatter_resolver'

module Model
  module TodoFormatter
    # TodoFormatter Interface
    module TodoFormattable
      def call
        raise NotImplementedError
      end

      def self.included(base)
        FormatterResolver.add(base)
        base.extend(ClassMethods)
      end

      # rubocop:disable Style/Documentation
      module ClassMethods
        def supports?(target)
          raise NotImplementedError
        end
      end
      # rubocop:enable Style/Documentation
    end
  end
end
