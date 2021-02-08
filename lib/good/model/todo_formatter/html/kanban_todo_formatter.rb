# frozen_string_literal: true

require_relative '../todo_formattable'

module Model
  module TodoFormatter
    module HTML
      # Format CalendarTodo
      class KanbanTodoFormatter
        include TodoFormattable

        attr_reader :todo

        def initialize(todo)
          @todo = todo
        end

        def call
          format(
            '<p>%<status>s</p><p>%<title>s</p><p>%<project>s)</p><p>%<url>s</p>',
            status: format_status, title: todo.title, project: todo.project, url: todo.url
          )
        end

        def self.supports?(target, type)
          type.to_sym == :html && target.instance_of?(Entity::KanbanTodo)
        end

        private

        def format_status
          status_label = { pending: '未着手', working: '進行中', complete: '完了' }
          status_label[todo.status.to_sym]
        end
      end
    end
  end
end
