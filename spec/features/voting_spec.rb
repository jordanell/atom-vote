require 'rails_helper'

feature 'Vote gets created' do
  before(:each) do
    @poll = FactoryGirl.create(:poll)
  end

  scenario 'with valid selection' do
    visit poll_path(@poll.uuid)
    page.should have_content(@poll.question)

    select_option(@poll.options.first.id)

    click_button 'Vote'

    page.should have_content('Total Votes')
  end

  scenario 'with invalid selection' do
    visit poll_path(@poll.uuid)
    page.should have_content(@poll.question)

    click_button 'Vote'

    page.should have_content('Your vote had the following errors:')
  end
end

feature 'Vote gets skipped' do
  before(:each) do
    @poll = FactoryGirl.create(:poll)
  end

  scenario 'with go to results' do
    visit poll_path(@poll.uuid)
    page.should have_content(@poll.question)

    click_button 'Go To Results'

    page.should have_content('Total Votes')
  end
end
