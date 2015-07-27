FactoryGirl.define do
  factory :poll do
    uuid SecureRandom.urlsafe_base64
    questions { [FactoryGirl.create(:question)] }
  end
end