# frozen_string_literal: true

require_relative '../../model/concerns/csv_convertible'

module Model
  module ExportFormatter
    # Format context to csv
    class CSVFormatter
      attr_reader :context

      def initialize(context)
        @context = Array(context).extend(CSVConvertible)
      end

      def call
        context.to_csv
      end

      def self.type
        :csv
      end
    end
  end
end
