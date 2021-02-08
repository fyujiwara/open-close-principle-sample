# frozen_string_literal: true

module Model
  module ExportFormatter
    # Format context to simple text
    class HTMLFormatter
      attr_reader :context

      def initialize(context)
        @context = Array(context)
      end

      def call
        <<~"HTML"
          <html>
            <head>
              <title>export</title>
            </head>
            <body>
              #{context.join("\n")}
            </body>
          </html>
        HTML
      end

      def self.type
        :html
      end
    end
  end
end
