class PollsController < ApplicationController
  before_filter :fetch_poll, only: [:show, :results]

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
