# frozen_string_literal: true

module Model
  module TodoFormatter
    # Format CalendarTodo
    class CalendarTodoFormatter
      Model::TodoFormatter::FormatterResolver.add(self)

      attr_reader :todo

      def initialize(todo)
        @todo = todo
      end

      def call
        format(
          "[%<status>s]%<title>s(%<place>s)\n%<url>s",
          status: format_status, title: todo.title, place: todo.place, url: todo.url
        )
      end

      def self.supports?(target)
        target.instance_of?(Entity::CalendarTodo)
      end

      private

      def format_status
        now = Time.now
        if !todo.end_datetime.nil? && todo.end_datetime < now
          '完了'
        else
          todo.target_datetime.strftime('%-m/%-d %H時')
        end
      end
    end
  end
end
