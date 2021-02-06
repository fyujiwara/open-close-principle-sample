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
      content_array = todo_list.map do |todo|
        buf = format_title_line(todo)
        buf << "\n"
        buf << todo.url
        buf
      end

      content = content_array.join("\n----\n")
      File.open(path, 'w') { |f| f.print content }
    end

    def format_title_line(todo)
      now = Time.now

      if todo.instance_of?(Entity::CalendarTodo) && (todo.end_datetime.nil? || todo.end_datetime > now)
        status = "[#{todo.target_datetime.strftime('%-m/%-d %H時')}]"
      else
        status_label = { pending: '未着手', working: '進行中', complete: '完了' }
        status = "[#{status_label[todo.status.to_sym]}]"
      end

      status + todo.title + (todo.instance_of?(Entity::CalendarTodo) ? "(#{todo.place})" : '')
    end
  end
end
