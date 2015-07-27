require 'rails_helper'

describe 'shared/_header.html.erb' do
  it 'should display the logo' do
    render partial: 'shared/header'

    rendered.should have_css("img[alt*='AtomVote']")
  end

  it 'should display the title' do
    render partial: 'shared/header'

    rendered.should have_selector('span', text: 'AtomVote')
  end

  it 'should display the new poll button' do
    render partial: 'shared/header'

    rendered.should have_selector('div', text: 'New Poll')
  end
end