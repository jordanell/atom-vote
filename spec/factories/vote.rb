FactoryGirl.define do
  factory :vote do
    voter_uuid SecureRandom.uuid
    option
    poll
  end
end