# frozen_string_literal: true

module Entity
  # ProjectTodo Entity
  class KanbanTodo
    attr_reader :title, :url, :status, :project

    def initialize(title:, url:, status:, project:)
      @title = title
      @url = url
      @status = status
      @project = project
    end
  end
end
