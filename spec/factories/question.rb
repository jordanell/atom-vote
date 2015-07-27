FactoryGirl.define do
  factory :question do
    title 'My test question'

    after(:create) do |question|
      FactoryGirl.create(:poll, questions: [question])
    end
  end
end