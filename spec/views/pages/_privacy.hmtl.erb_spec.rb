require 'rails_helper'

describe 'pages/_privacy.html.erb' do
  it 'should display the title' do
    render partial: 'pages/privacy'

    rendered.should have_content('Privacy Policy')
  end

  it 'should have a link to strawpoll' do
    render partial: 'pages/privacy'

    rendered.should have_selector('a', text: 'StrawPoll')
  end
end
