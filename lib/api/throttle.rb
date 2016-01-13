require 'rack/throttle'

class ApiThrottle < Rack::Throttle::Hourly
  ##
  # Returns `false` if the rate limit has been exceeded for the given
  # `request`, or `true` otherwise.
  #
  # Rate limits are only imposed on the "api" controller
  #
  # @param  [Rack::Request] request
  # @return [Boolean]
  def allowed?(request)
    path_info = (Rails.application.routes.recognize_path request.url rescue {}) || {}

    # Check if this route should be rate-limited
    if path_info[:controller] && path_info[:controller].include?('api/')
      super
    else
      # Other routes are not throttled, so we allow them
      true
    end
  end
end
