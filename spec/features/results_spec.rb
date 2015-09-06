require 'rails_helper'

feature 'Viewing poll results' do
  before(:each) do
    @poll = FactoryGirl.create(:poll)
    @vote = FactoryGirl.create(:vote, poll: @poll, option: @poll.options.first)
  end

  scenario 'should show all options', js: true do
    visit results_poll_path(@poll.uuid)
    page.should have_content(@poll.question)

    @poll.options.each do |option|
      page.should have_content(option.text)
    end
  end

  scenario 'should show meta data', js: true do
    visit results_poll_path(@poll.uuid)
    page.should have_content(@poll.question)

    page.should have_content('Total')
    page.should have_selector("span#data-total", text: @poll.votes.count)
    page.should have_content('Last')
  end

  scenario 'should show the correct number of votes per option', js: true do
    visit results_poll_path(@poll.uuid)
    page.should have_content(@poll.question)

    @poll.options.each do |option|
      page.should have_selector("span#option_#{option.id}_count", text: option.votes.count)
    end
  end

  scenario 'should show the correct percentage of votes per option', js: true do
    visit results_poll_path(@poll.uuid)
    page.should have_content(@poll.question)

    @poll.options.each do |option|
      page.should have_selector("span#option_#{option.id}_percentage", text: "(#{option.percentage_of_votes}%)")
    end
  end
end
