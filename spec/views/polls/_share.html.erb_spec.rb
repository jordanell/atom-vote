require 'rails_helper'

describe 'polls/_share.html.erb' do
  context 'with poll instance variable' do
    before(:each) do
      @poll = FactoryGirl.create(:poll)
    end

    it 'should display the share text' do
      render partial: 'polls/share'

      rendered.should have_content('Share this poll')
    end

    it 'should display the input' do
      render partial: 'polls/share'

      rendered.should have_selector('input')
    end
  end

  context 'without poll instance variable' do
    it 'should fail to render the template' do
      expect{render}.to raise_error(ActionView::Template::Error)
    end
  end
end
