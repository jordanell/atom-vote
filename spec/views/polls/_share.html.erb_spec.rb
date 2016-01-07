require 'rails_helper'

describe 'polls/_share.html.erb' do
  context 'with poll instance variable' do
    before(:each) do
      @poll = FactoryGirl.create(:poll)
    end

    it 'should display the share text in post_main' do
      render partial: 'polls/share'

      view.content_for(:post_main).should have_content('Share This Poll')
    end

    it 'should display the link in post_main' do
      render partial: 'polls/share'

      view.content_for(:post_main).should have_content(@poll.uuid)
    end

    it 'should not have any content outside post_main' do
      render partial: 'polls/share'

      render.should eq('')
    end
  end

  context 'without poll instance variable' do
    it 'should fail to render the template' do
      expect{ render }.to raise_error(ActionView::Template::Error)
    end
  end
end
