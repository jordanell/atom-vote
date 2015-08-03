require 'rails_helper'

describe 'polls/_share.html.erb' do
  it 'should display the share text' do
    render partial: 'polls/share'

    rendered.should have_content('Share this poll')
  end

  it 'should display the input' do
    render partial: 'polls/share'

    rendered.should have_selector('input')
  end
end
