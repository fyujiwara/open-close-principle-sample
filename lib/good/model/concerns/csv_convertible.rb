# frozen_string_literal: true

require 'csv'

module Model
  # convert an array of hashes
  module CSVConvertible
    def to_csv(*filter_keys)
      header = inject([]) { |keys, hash| keys | hash.keys } if filter_keys.empty?
      CSV.generate do |csv|
        csv << header
        each { |hash| csv << hash.values_at(*header) }
      end
    end
  end
end
