# frozen_string_literal: true

module Model
  module TodoFormatter
    # resolve formatter for todo
    class FormatterResolver
      class << self
        def add(formatter)
          formatters << formatter
        end

        def resolve(todo)
          formatters.each do |formatter|
            break formatter if formatter.supports?(todo)
          end
        end

        def formatters
          @formatters ||= Set.new
        end
      end
    end
  end
end
