module Api
  module V1
    class PollsController < BaseController
      include AnalyticsHelper

      before_filter :fetch_poll, only: [:show]

      def create
        @poll = Poll.new(poll_params)

        if @poll.save
          send_event('Polls', 'Create')

          render json: PollSerializer.new(@poll), status: 201
        else
          render json: { message: 'Poll creation failed', errors: @poll.errors.full_messages }, status: 422
        end
      end

      def show
        render json: PollSerializer.new(@poll), status: 200
      end

      private

      def fetch_poll
        @poll = Poll.find_by(uuid: params[:id])

        unless @poll
          return render_error(404)
        end
      end

      def poll_params
        params.require(:poll).permit(:question,
          options_attributes: [
            :text
          ]
        )
      end
    end
  end
end
