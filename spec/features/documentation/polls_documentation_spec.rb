require 'rails_helper'

feature 'Visit polls documentation' do
  scenario 'by direct link' do
    visit api_documentation_page('polls')

    page.should have_content('POST /api/v1/polls')
    page.should have_content('GET /api/v1/polls/:uuid')
  end
end

feature 'Visit documentation for' do
  scenario 'polls create' do
    visit api_documentation_page('polls/create')

    page.should have_content('POST /api/v1/polls')
    page.should have_content('Supported Formats')
    page.should have_content('Errors')
    page.should have_content('Examples')
    page.should have_content('Params')
  end

  scenario 'polls show' do
    visit api_documentation_page('polls/show')

    page.should have_content('GET /api/v1/polls/:uuid ')
    page.should have_content('Supported Formats')
    page.should have_content('Errors')
    page.should have_content('Examples')
    page.should have_content('Params')
  end
end
