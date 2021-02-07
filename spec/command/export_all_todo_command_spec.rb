# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength
RSpec.describe 'ExportAllTodoCommand' do
  describe 'execute' do
    let(:todo_list) { [] }
    let(:path) { 'tmp/todo_list.txt' }
    let(:simple_text_formatter) { Model::ExportFormatter::SimpleTextFormatter }
    let(:command) do
      Command::ExportAllTodoCommand.new(todo_list: todo_list, path: path, export_formatter: simple_text_formatter)
    end

    after(:each) do
      File.delete(path) if File.exist?(path)
    end

    it 'created file containing a todo list' do
      expect { command.execute }.to change { File.exist?(path) }.from(false).to(true)
    end

    context 'when todo' do
      let(:todo) { Entity::Todo.new(title: 'buy coffee', url: 'https://example.com/todo/1', status: :pending) }
      let(:todo_list) { [todo] }
      before(:each) { command.execute }

      it 'format with [status]title \n url' do
        expect(File.read(path)).to be_include "[未着手]buy coffee\nhttps://example.com/todo/1"
      end
    end

    context 'when calendar todo' do
      let(:calendar_todo) do
        Entity::CalendarTodo.new(title: 'buy coffee', url: 'https://example.com/todo/2', place: 'umeda',
                                 target_datetime: Time.local(2021, 2, 6, 10), end_datetime: nil)
      end
      let(:todo_list) { [calendar_todo] }
      before(:each) { command.execute }

      it 'format with [target_datetime status]title(place) \n url' do
        expect(File.read(path)).to be_include "[2/6 10時]buy coffee(umeda)\nhttps://example.com/todo/2"
      end
    end

    context 'when kanban todo' do
      let(:kanban_todo) do
        Entity::KanbanTodo.new(title: 'buy coffee', url: 'https://example.com/todo/3', status: :complete,
                               project: 'briefing')
      end
      let(:todo_list) { [kanban_todo] }
      before(:each) { command.execute }

      it 'format with [status]title(project) \n url' do
        expect(File.read(path)).to be_include "[完了]buy coffee(briefing)\nhttps://example.com/todo/3"
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
