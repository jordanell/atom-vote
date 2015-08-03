class VotesController < ApplicationController
  before_filter :fetch_poll, only: [:create]

  def create
    @vote = Vote.new(vote_params)

    if @vote.save
      redirect_to results_poll_path(@vote.poll)
    else
      render template: 'polls/show'
    end
  end

  private

  def fetch_poll
    @poll = Poll.find_by(uuid: params[:id])

    unless @poll
      # TODO: change this to custom 404 page.
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  def vote_params
    params.require(:vote).permit(:poll_id,
      :option_id,
    )
  end
end
