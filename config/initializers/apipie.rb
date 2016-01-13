Apipie.configure do |config|
  config.app_name                = 'AtomVote'
  config.api_base_url            = '/api/v1'
  config.doc_base_url            = '/documentation/api'

  # Where is your API defined?
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/api/v1/*.rb"

  # Turn off validation
  config.validate = false

  # layout
  config.layout = 'layouts/documentation'
end
