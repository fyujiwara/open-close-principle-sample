# frozen_string_literal: true

require_relative '../todo_formattable'

module Model
  module TodoFormatter
    module HTML
      # Format CalendarTodo
      class CalendarTodoFormatter
        include TodoFormattable

        attr_reader :todo

        def initialize(todo)
          @todo = todo
        end

        def call
          format(
            '<p>%<status>s</p><p>%<title>s</p><p>%<place>s</p><p>%<url>s</p>',
            status: format_status, title: todo.title, place: todo.place, url: todo.url
          )
        end

        def self.supports?(target, type)
          type.to_sym == :html && target.instance_of?(Entity::CalendarTodo)
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
end
