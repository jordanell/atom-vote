FactoryGirl.define do
  factory :question do
    title 'My test question'

    after(:build) do |question|
      (0..1).each do |index|
        question.choices << FactoryGirl.build(:choice, question: question)
      end
    end

    after(:create) do |question|
      FactoryGirl.create(:poll, questions: [question])
    end
  end
end