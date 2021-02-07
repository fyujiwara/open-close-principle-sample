# frozen_string_literal: true

module Command
  # export text file containing todo list
  class ExportAllTodoCommand
    attr_reader :todo_list, :path, :export_formatter

    def initialize(todo_list:, path:, export_formatter:)
      @todo_list = todo_list
      @path = path
      @export_formatter = export_formatter
    end

    def execute
      contents = todo_list.map do |todo|
        formatter = Model::TodoFormatter::FormatterResolver.resolve(todo, export_formatter.type)
        formatter.new(todo).call
      end

      content = export_formatter.new(contents).call
      File.write(path, content)
    end
  end
end
