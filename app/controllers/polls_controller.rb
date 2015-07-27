class PollsController < ApplicationController
  before_filter :fetch_poll, only: [:show]

  def new
    @poll = Poll.new
  end

  def create
    @poll = Poll.new(poll_params)

    if @poll.save
      redirect_to poll_path(@poll.uuid)
    else
      render template: 'polls/new'
    end
  end

  def show
    @question = @poll.questions.first
  end

  private

  def fetch_poll
    @poll = Poll.find_by(uuid: params[:id])

    unless @poll
      # TODO: change this to custom 404 page.
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  def poll_params
    params.require(:poll).permit(questions_attributes: [
      :title,
      choices_attributes: [:title]
    ])
  end
end
