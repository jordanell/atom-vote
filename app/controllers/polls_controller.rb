class PollsController < ApplicationController
  before_filter :fetch_poll, only: [:show]

  def new
    @poll = Poll.new

    @poll.pad_options(4)
  end

  def create
    @poll = Poll.new(poll_params)

    if @poll.save
      redirect_to poll_path(@poll.uuid)
    else
      @poll.pad_options(4-supplied_options.length)
      render template: 'polls/new'
    end
  end

  def show
  end

  private

  def fetch_poll
    @poll = Poll.find_by(uuid: params[:id])

    unless @poll
      # TODO: change this to custom 404 page.
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  def supplied_options
    options = []
    params[:poll][:options_attributes].each do |key, option|
      if option['text'].try(:length) > 1
        options.push option
      end
    end

    options
  end

  def poll_params
    params.require(:poll).permit(:question,
      options_attributes: [
        :text
      ]
    )
  end
end
