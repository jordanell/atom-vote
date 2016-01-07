require 'rails_helper'

feature 'Vote gets created' do
  before(:each) do
    @poll = FactoryGirl.create(:poll)
  end

  scenario 'with valid selection', js: true do
    visit poll_path(@poll.uuid)
    page.should have_content(@poll.question)

    select_option(@poll.options.first.id)

    click_button 'Vote'

    page.should have_content('Total')
  end

  scenario 'with invalid selection' do
    visit poll_path(@poll.uuid)
    page.should have_content(@poll.question)

    click_button 'Vote'

    page.should have_content('You must select an option')
  end
end

feature 'Vote gets skipped' do
  before(:each) do
    @poll = FactoryGirl.create(:poll)
  end

  scenario 'with go to results', js: true do
    visit poll_path(@poll.uuid)
    page.should have_content(@poll.question)

    click_link 'View Results'

    page.should have_content('Total')
  end
end
