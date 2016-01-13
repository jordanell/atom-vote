module Api
  module V1
    class VotesController < BaseController
      include AnalyticsHelper

      before_filter :fetch_poll, only: [:create]

      resource_description do
        short 'Votes'
        formats ['json']
        api_version 'v1'
      end

      api :POST, '/votes', 'Create vote'
      description 'Create a vote on a poll.'
      param :vote, Hash, required: true, desc: 'Vote information' do
        param :poll_uuid, String, required: true, desc: 'The uuid of the poll to be voted on'
        param :option_id, Integer, required: true, desc: 'The id of the poll option to cast a vote for'
      end
      error 404, 'Not found'
      error 422, 'Unprocessable entity'
      example <<-EOS
        {
          vote: {
            poll_uuid: '123abc',
            option_id: 555
          }
        }
      EOS
      def create
        @vote = Vote.new(vote_params)
        @vote.poll = @poll

        # Attach the session id
        # If they don't have a session ID something bad has happened
        # Still let them vote but attaching something random
        @vote.voter_uuid = session.id || SecureRandom.urlsafe_base64

        if @vote.save
          send_event('Votes', 'Create')

          render json: VoteSerializer.new(@vote), status: 201
        else
          render json: { message: 'Vote creation failed', errors: @vote.errors.full_messages }, status: 422
        end
      end

      private

      def fetch_poll
        @poll = Poll.find_by!(uuid: params[:vote].try(:[], 'poll_uuid'))

      rescue ActiveRecord::RecordNotFound
        return render_error(404)
      end

      def vote_params
        params.require(:vote).permit(:poll_id,
          :option_id,
        )
      end
    end
  end
end
