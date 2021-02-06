# frozen_string_literal: true

module Command
  # export text file containing todo list
  class ExportAllTodoCommand
    attr_reader :todo_list, :path

    def initialize(todo_list:, path:)
      @todo_list = todo_list
      @path = path
    end

    def execute
      contents = todo_list.map do |todo|
        formatter = Model::TodoFormatter::FormatterResolver.resolve(todo)
        formatter.new(todo).call
      end

      content = contents.join("\n----\n")
      File.open(path, 'w') { |f| f.print content }
    end
  end
end
