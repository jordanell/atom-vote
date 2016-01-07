require 'rails_helper'

describe 'pages/_terms.html.erb' do
  it 'should display the title' do
    render partial: 'pages/terms'

    rendered.should have_content('Terms of Service')
  end

  it 'should have a link to strawpoll' do
    render partial: 'pages/terms'

    rendered.should have_selector('a', text: 'StrawPoll')
  end
end
