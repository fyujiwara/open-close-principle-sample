# frozen_string_literal: true

require_relative 'todo_formattable'

module Model
  module TodoFormatter
    # Format CalendarTodo
    class KanbanTodoFormatter
      include TodoFormattable

      attr_reader :todo

      def initialize(todo)
        @todo = todo
      end

      def call
        format(
          "[%<status>s]%<title>s(%<project>s)\n%<url>s",
          status: format_status, title: todo.title, project: todo.project, url: todo.url
        )
      end

      def self.supports?(target)
        target.instance_of?(Entity::KanbanTodo)
      end

      private

      def format_status
        status_label = { pending: '未着手', working: '進行中', complete: '完了' }
        status_label[todo.status.to_sym]
      end
    end
  end
end
