require 'rails_helper'

describe 'polls/results.html.erb' do
  context 'with poll instance variable' do
    before(:each) do
      @poll = FactoryGirl.create(:poll)
      @poll.save
    end

    it 'should render the page' do
      expect{render}.to_not raise_error
    end
  end

  context 'without poll instance variable' do
    it 'should fail to render the template' do
      expect{render}.to raise_error(ActionView::Template::Error)
    end
  end
end