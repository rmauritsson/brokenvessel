# frozen_string_literal: true

Airrecord.api_key = Rails.application.credentials.airtable[:api_key]

module AirTable
  class Listener < Airrecord::Table
    self.base_key = Rails.application.credentials.airtable[:listener_table_app_id]
    self.table_name = 'listener'
  end
end
