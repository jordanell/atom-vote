module AnalyticsHelper
  def send_event(category, action, label = nil, value = nil)
    if category && action && GOOGLE_ANALYTICS
      gabba = Gabba::Gabba.new(GOOGLE_ANALYTICS, 'leanpub.com')
      gabba.identify_user(cookies[:__utma], cookies[:__utmz])

      gabba.event(category, action, label, value)
    end
  end
end
