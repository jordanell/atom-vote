require 'rails_helper'

describe 'polls/show.html.erb' do
  context 'with poll and vote instance variables' do
    before(:each) do
      @poll = FactoryGirl.create(:poll)
      @poll.save

      @vote = @poll.votes.build
    end

    it 'should display the question' do
      render

      rendered.should have_content(@poll.question)
    end

    it 'should display the options' do
      render

      @poll.options.each do |option|
        rendered.should have_selector("input[id='vote_option_id_#{option.id}']")
      end
    end

    it 'should display the option text' do
      render

      @poll.options.each do |option|
        rendered.should have_content(option.text)
      end
    end

    it 'should display the "View Results" button' do
      render

      rendered.should have_content('View Results')
    end
  end

  context 'without poll instance variable' do
    before(:each) do
      @vote = Vote.new
    end

    it 'should fail to render the template' do
      expect{render}.to raise_error(ActionView::Template::Error)
    end
  end

  context 'without vote instance variable' do
    before(:each) do
      @poll = FactoryGirl.create(:poll)
      @poll.save
    end

    it 'should fail to render the template' do
      expect{render}.to raise_error(ActionView::Template::Error)
    end
  end
end
