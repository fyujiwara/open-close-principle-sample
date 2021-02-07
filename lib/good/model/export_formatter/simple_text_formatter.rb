# frozen_string_literal: true

module Model
  module ExportFormatter
    # Format context to simple text
    class SimpleTextFormatter
      attr_reader :context

      def initialize(context)
        @context = Array(context)
      end

      def call
        context.join("\n----\n")
      end

      def self.type
        :simple_text
      end
    end
  end
end
