Dir[Rails.root.join('spec/support/features/*.rb')].each {|file| require file }

RSpec.configure do |config|
  config.include Features::PollHelpers, type: :feature
  config.include Features::VoteHelpers, type: :feature
end
