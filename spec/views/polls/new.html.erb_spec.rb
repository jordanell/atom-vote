require 'rails_helper'

describe 'polls/new.html.erb' do
  context 'with poll instance variable' do
    before(:each) do
      @poll = Poll.new
    end

    it 'should display the question input' do
      render

      rendered.should have_selector("input[name='poll[questions_attributes][0][title]']")
    end

    it 'should display the question choice inputs' do
      render

      (0..3).each do |index|
        rendered.should have_selector("input[name='poll[questions_attributes][0][choices_attributes][#{index}][title]']")
      end
    end

    it 'should display errors when needed' do
      @poll.save

      render

      rendered.should have_content('Your poll had the following errors:')
    end
  end

  context 'without poll instance variable' do
    it 'should fail to render the template' do
      expect{render}.to raise_error(ActionView::Template::Error)
    end
  end
end