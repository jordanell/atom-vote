require 'rails_helper'

describe 'shared/_footer.html.erb' do
  it 'should display the logo' do
    render partial: 'shared/footer'

    rendered.should have_css("img[alt*='AtomVote']")
  end

  it 'should display the correct link' do
    render partial: 'shared/footer'

    ['New Poll', 'Terms of Service', 'Privacy Policy'].each do |link|
      rendered.should have_selector('a', text: link)
    end
  end
end