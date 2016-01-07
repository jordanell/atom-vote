require 'rails_helper'

describe 'polls/new.html.erb' do
  context 'with poll instance variable' do
    before(:each) do
      @poll = Poll.new
    end

    it 'should display the question input' do
      render

      rendered.should have_selector("input[name='poll[question]']")
    end

    it 'should display the option inputs' do
      @poll.pad_options

      render

      (0..3).each do |index|
        rendered.should have_selector("input[name='poll[options_attributes][#{index}][text]']")
      end
    end

    it 'should display errors when needed' do
      @poll.save

      render

      rendered.should have_content('Error')
    end
  end

  context 'without poll instance variable' do
    it 'should fail to render the template' do
      expect{render}.to raise_error(ActionView::Template::Error)
    end
  end
end
