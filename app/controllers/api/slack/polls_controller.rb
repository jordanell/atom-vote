class Api::Slack::PollsController < ApplicationController
  def create
    # Parse the input from slack
    options = parse_text(params[:text])

    @poll = Poll.new(options['poll'])

    if @poll.save
      Gabba::Gabba.new(GOOGLE_ANALYTICS, 'atomvote.com').event('Polls', 'Create')

      render text: "#{request.base_url}/polls/#{@poll.uuid}"
    else
      render text: 'Poll creation failed', status: 422
    end
  end

  private

  def parse_text(text)
    question = text.match(/^(.*\?)/).try(:captures)

    params_for_poll = { 'poll' => { 'options_attributes' => {} } }
    params_for_poll['poll']['question'] = question.try(:[], 0).try(:strip)

    # Get all the options
    text.scan(/\d+\.\s+(.*?)(?=(?:\d+|\z))/).each_with_index do |match, index|
      params_for_poll['poll']['options_attributes']["#{index}"] = {}
      params_for_poll['poll']['options_attributes']["#{index}"]['text'] = match.try(:[], 0).try(:strip)
    end

    params_for_poll
  end
end
