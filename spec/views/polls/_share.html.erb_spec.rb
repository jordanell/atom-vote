require 'rails_helper'

describe 'polls/_share.html.erb' do
  context 'with poll instance variable' do
    before(:each) do
      @poll = FactoryGirl.create(:poll)
    end

    it 'should display the share text' do
      render partial: 'polls/share'

      rendered.should have_content('Share This Poll')
    end

    it 'should display the input' do
      render partial: 'polls/share'

      rendered.should have_content(@poll.uuid)
    end
  end

  context 'without poll instance variable' do
    it 'should fail to render the template' do
      expect{render}.to raise_error(ActionView::Template::Error)
    end
  end
end
