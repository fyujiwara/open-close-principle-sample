# frozen_string_literal: true

module Entity
  # CalendarTodo Entity
  class CalendarTodo
    attr_reader :title, :url, :place, :target_datetime, :end_datetime

    def initialize(title:, url:, place:, target_datetime:, end_datetime:)
      @title = title
      @url = url
      @place = place
      @target_datetime = target_datetime
      @end_datetime = end_datetime
    end
  end
end
