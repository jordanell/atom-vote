require 'rails_helper'

feature 'Visit root of documentation' do
  scenario 'by clicking in footer' do
    visit root_path

    page.should have_content('AtomVote')

    find('a', text: 'API').click

    page.should have_content('Resources')
    page.should have_content('Polls')
    page.should have_content('Votes')
  end
end

feature 'Visit polls documentation' do
  scenario 'by clicking in root documentation' do
    visit api_documentation_page

    page.should have_content('AtomVote')

    find('a', text: 'Polls').click

    page.should have_content('Supported Formats')
  end
end

feature 'Visit polls resource documentation' do
  scenario 'by clicking in root documentation for create' do
    visit api_documentation_page

    page.should have_content('AtomVote')

    find('a', text: 'POST /api/v1/polls').click

    page.should have_content('Supported Formats')
  end

  scenario 'by clicking in root documentation for show' do
    visit api_documentation_page

    page.should have_content('AtomVote')

    find('a', text: 'GET /api/v1/polls/:uuid').click

    page.should have_content('Supported Formats')
  end
end

feature 'Visit votes documentation' do
  scenario 'by clicking in root documentation' do
    visit api_documentation_page

    page.should have_content('AtomVote')

    find('a', text: 'Votes').click

    page.should have_content('Supported Formats')
  end
end

feature 'Visit votes resource documentation' do
  scenario 'by clicking in root documentation for create' do
    visit api_documentation_page

    page.should have_content('AtomVote')

    find('a', text: 'POST /api/v1/votes').click

    page.should have_content('Supported Formats')
  end
end
