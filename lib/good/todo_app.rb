# frozen_string_literal: true

require_relative 'command/export_all_todo_command'
require_relative 'model/todo_formatter/formatter_resolver'
require_relative 'model/todo_formatter/simple_text/calendar_todo_formatter'
require_relative 'model/todo_formatter/simple_text/kanban_todo_formatter'
require_relative 'model/todo_formatter/simple_text/todo_formatter'
require_relative 'model/todo_formatter/csv/calendar_todo_formatter'
require_relative 'model/todo_formatter/csv/kanban_todo_formatter'
require_relative 'model/todo_formatter/csv/todo_formatter'
require_relative 'model/todo_formatter/html/calendar_todo_formatter'
require_relative 'model/todo_formatter/html/kanban_todo_formatter'
require_relative 'model/todo_formatter/html/todo_formatter'
require_relative 'model/export_formatter/simple_text_formatter'
require_relative 'model/export_formatter/csv_formatter'
require_relative 'model/export_formatter/html_formatter'
require_relative 'entity/todo'
require_relative 'entity/calendar_todo'
require_relative 'entity/kanban_todo'
require_relative 'repository/todo_repository'

class TodoApp
end
