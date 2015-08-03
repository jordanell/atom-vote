require 'rails_helper'

describe 'pages/_terms.html.erb' do
  it 'should display the title' do
    render partial: 'shared/footer'

    rendered.should have_content('Terms of Service')
  end
end