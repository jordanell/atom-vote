require 'rails_helper'

feature 'Visit votes documentation' do
  scenario 'by direct link' do
    visit api_documentation_page('votes')

    page.should have_content('POST /api/v1/votes')
  end
end

feature 'Visit documentation for' do
  scenario 'votes create' do
    visit api_documentation_page('votes/create')

    page.should have_content('POST /api/v1/votes')
    page.should have_content('Supported Formats')
    page.should have_content('Errors')
    page.should have_content('Examples')
    page.should have_content('Params')
  end
end
