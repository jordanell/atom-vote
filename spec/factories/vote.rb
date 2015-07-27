FactoryGirl.define do
  factory :vote do
    voter_uuid SecureRandom.uuid
    choice
  end
end