class VotesController < ApplicationController
  before_filter :fetch_poll, only: [:create]

  def create
    @vote = Vote.new(vote_params)

    # Attach the session id
    @vote.voter_uuid = session.id

    if @vote.save
      redirect_to results_poll_path(@vote.poll.uuid)
    else
      render template: 'polls/show'
    end
  end

  private

  def fetch_poll
    @poll = Poll.find(params[:vote].try(:[], 'poll_id'))

  rescue ActiveRecord::RecordNotFound
    return render_error(404)
  end

  def vote_params
    params.require(:vote).permit(:poll_id,
      :option_id,
    )
  end
end
