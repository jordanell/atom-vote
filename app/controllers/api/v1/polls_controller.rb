module Api
  module V1
    class PollsController < BaseController
      include AnalyticsHelper

      before_filter :fetch_poll, only: [:show]

      resource_description do
        short 'Polls'
        formats ['json']
        api_version 'v1'
      end

      api :POST, '/polls', 'Create poll'
      description 'Create poll with specifed poll parameters.'
      param :poll, Hash, required: true, desc: 'Poll information' do
        param :question, String, required: true, desc: 'The question to be asked in the poll'
        param :options_attributes, Hash, required: true, desc: 'Poll options' do
          param :text, String, required: true, desc: 'The poll option text'
        end
      end
      error 422, 'Unprocessable entity'
      example <<-EOS
        {
          poll: {
            question: 'Where should we go for lunch?',
            options_attributes: {
              '0': {
                text: 'Thai'
              },
              '1': {
                text: 'Sushi'
              }
            }
          }
        }
      EOS
      def create
        @poll = Poll.new(poll_params)

        if @poll.save
          send_event('Polls', 'Create')

          render json: PollSerializer.new(@poll), status: 201
        else
          render json: { message: 'Poll creation failed', errors: @poll.errors.full_messages }, status: 422
        end
      end

      api :GET, '/polls/:uuid', 'Show poll'
      description 'Get poll from uuid'
      param :uuid, String, required: true, desc: 'Uuid of poll'
      error 404, 'Not found'
      example <<-EOS
        /polls/123abc
      EOS
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
