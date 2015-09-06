class VotesController < ApplicationController
  include AnalyticsHelper

  before_filter :fetch_poll, only: [:create]

  def create
    @vote = Vote.new(vote_params)

    # Attach the session id
    # If they don't have a session ID something bad has happened
    # Still let them vote but attaching something random
    @vote.voter_uuid = session.id || SecureRandom.urlsafe_base64

    if @vote.save
      send_event('Votes', 'Create')

      respond_to do |format|
        format.html { redirect_to results_poll_path(@vote.poll.uuid) }
        format.json { render json: { vote: VoteSerializer.new(@vote) } }
      end
    else
      respond_to do |format|
        format.html { render template: 'polls/show' }
        format.json { render json: { message: 'Vote creation failed', errors: @vote.errors.full_messages }, status: 422 }
      end
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
