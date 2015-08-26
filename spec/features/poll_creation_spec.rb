require 'rails_helper'

feature 'Poll gets created' do
  scenario 'with valid quesiton and options' do
    visit root_path
    page.should have_content('AtomVote')

    fill_in_question
    fill_in_option(0)
    fill_in_option(1)

    click_button 'Create Poll'

    page.should have_content('Share this poll')
  end

  scenario 'with invalid question' do
    visit root_path
    page.should have_content('AtomVote')

    fill_in_option(0)
    fill_in_option(1)

    click_button 'Create Poll'

    page.should have_content('Your poll had the following errors:')
  end

  scenario 'with invalid question and extra options', js: true do
    visit root_path
    page.should have_content('AtomVote')

    fill_in_option(3)
    fill_in_option(4)

    click_button 'Create Poll'

    page.should have_content('Your poll had the following errors:')
  end

  scenario 'with only 1 option' do
    visit root_path
    page.should have_content('AtomVote')

    fill_in_question
    fill_in_option(0)

    click_button 'Create Poll'

    page.should have_content('Your poll had the following errors:')
  end
end

feature 'Poll being built' do
  scenario 'should auto focus the question input' do
    visit root_path
    page.should have_content('AtomVote')

    find_field('poll[question]')[:autofocus].should be_present
  end

  scenario 'should add an option when last option is edited', js: true do
    visit root_path
    page.should have_content('AtomVote')

    fill_in_question
    fill_in_option(3)
    fill_in_option(4)

    click_button 'Create Poll'

    page.should have_content('Share this poll')
  end
end