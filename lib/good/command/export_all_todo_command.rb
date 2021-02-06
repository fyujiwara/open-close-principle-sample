# frozen_string_literal: true

module Command
  # export text file containing todo list
  class ExportAllTodoCommand
    attr_reader :todo_list, :path, :todo_formatter, :calendar_todo_formatter

    def initialize(todo_list:, path:)
      @todo_list = todo_list
      @path = path
      @todo_formatter = Model::TodoFormatter::TodoFormatter
      @calendar_todo_formatter = Model::TodoFormatter::CalendarTodoFormatter
    end

    def execute
      contents = todo_list.map do |todo|
        case todo.class.name
        when 'Entity::Todo' then todo_formatter.new(todo).call
        when 'Entity::CalendarTodo' then calendar_todo_formatter.new(todo).call
        end
      end

      content = contents.join("\n----\n")
      File.open(path, 'w') { |f| f.print content }
    end
  end
end
