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
      @poll.pad_options

      render

      @poll.options.each do |option|
        if option.persisted?
          rendered.should have_selector("input[id='vote_option_#{option.id}']")
        end
      end
    end

    it 'should display the option text' do
      @poll.pad_options

      render

      @poll.options.each do |option|
        if option.persisted?
          rendered.should have_content(option.text)
        end
      end
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