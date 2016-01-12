class PollsController < ApplicationController
  include AnalyticsHelper

  before_filter :fetch_poll, only: [:show, :results]

  def new
    @poll = Poll.new

    @poll.pad_options(4)
  end

  def create
    @poll = Poll.new(poll_params)

    if @poll.save
      send_event('Polls', 'Create')

      redirect_to poll_path(@poll.uuid)
    else
      if supplied_options.length > 3
        @poll.pad_options(1)
      else
        @poll.pad_options(4-supplied_options.length)
      end

      render template: 'polls/new'
    end
  end

  def show
    if @poll.votes.map(&:voter_uuid).include?(session.try(:id)) && !request.xhr?
      return redirect_to results_poll_path(@poll.uuid)
    end

    @vote = @poll.votes.build
  end

  def results
  end

  private

  def fetch_poll
    @poll = Poll.find_by(uuid: params[:id])

    unless @poll
      return render_error(404)
    end

    set_seo
  end

  def set_seo
    set_meta_tags description: @poll.question,
                  og: {
                    description:  @poll.question,
                    url:          poll_url(@poll.uuid)
                  },
                  twitter: {
                    description:  @poll.question,
                    url:          poll_url(@poll.uuid)
                  }
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
