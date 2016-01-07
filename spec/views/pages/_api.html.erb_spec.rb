require 'rails_helper'

describe 'pages/_api.html.erb' do
  it 'should display the title' do
    render partial: 'pages/api'

    rendered.should have_content('API')
  end
end
