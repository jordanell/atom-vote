FactoryGirl.define do
  factory :poll do
    questions { [FactoryGirl.create(:question)] }
  end
end