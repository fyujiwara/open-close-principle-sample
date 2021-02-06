# frozen_string_literal: true

module Entity
  # Todo Entity
  class Todo
    attr_reader :title, :url, :status

    def initialize(title:, url:, status:)
      @title = title
      @url = url
      @status = status
    end
  end
end
