FactoryGirl.define do
  factory :poll do
    uuid SecureRandom.urlsafe_base64
    title 'My test poll'

    after(:build) do |poll|
      (0..1).each do |index|
        poll.options << FactoryGirl.build(:option, poll: poll)
      end
    end
  end
end