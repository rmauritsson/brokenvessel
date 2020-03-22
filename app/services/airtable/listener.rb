# frozen_string_literal: true

Airrecord.api_key = Rails.application.credentials.airtable[:api_key]

module AirTable
  class Listener < Airrecord::Table
    self.base_key = Rails.application.credentials.airtable[:listener_table_app_id]
    self.table_name = 'listener'

    def self.available
      all(filter: '{Status} = "Available"')
    end

    def self.assigned
      all(filter: '{Status} = "Assigned"')
    end

    def self.rested
      all(filter: '{Status} = "Rested"')
    end
  end
end

# AirTable::Listener.create(
#   'Name' => 'Charles Spurgen',
#   'Status' => 'Available',
#   'Email address' => 'charles.spurgen@example.com',
#   'Phone' => '(123) 456-7890',
#   'Location' => 'San Francisco'
# )
