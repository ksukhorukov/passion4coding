# frozen_string_literal: true

Apipie.configure do |config|
  config.app_name                = 'Passion4coding'
  config.api_base_url            = ''
  config.doc_base_url            = '/apipie'
  # where is your API defined?
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/**/*.rb"
  config.translate = false
  config.default_version = 'API documentation'
end
