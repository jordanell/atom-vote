require 'rails_helper'

describe 'polls/results.html.erb' do
  context 'with poll instance variable' do
    before(:each) do
      @poll = FactoryGirl.create(:poll)
      @poll.save
    end

    it 'should display the question' do
      render

      rendered.should have_content(@poll.question)
    end

    it 'should display the option text' do
      render

      @poll.options.each do |option|
        rendered.should have_content(option.text)
      end
    end

    it 'shoud display the correct number of votes per option' do
      render

      @poll.options.each do |option|
        rendered.should have_selector("span#option_#{option.id}_count", text: option.votes.count)
      end
    end

    it 'shoud display the correct percentage of votes per option' do
      render

      @poll.options.each do |option|
        rendered.should have_selector("span#option_#{option.id}_percentage", text: "(#{option.percentage_of_votes}%)")
      end
    end
  end

  context 'without poll instance variable' do
    it 'should fail to render the template' do
      expect{render}.to raise_error(ActionView::Template::Error)
    end
  end
end