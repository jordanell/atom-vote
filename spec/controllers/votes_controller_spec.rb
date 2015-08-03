require 'rails_helper'

RSpec.describe VotesController, type: :controller do
  describe '#create' do
    before(:each) do
      @poll = FactoryGirl.create(:poll)

      @params = {
        'vote': {
          'poll_id': @poll.id,
          'option_id': "#{@poll.options.first.id}"
        }
      }
    end

    it 'should create the vote' do
      expect { post :create, @params }.to change(Vote, :count).by(1)
    end

    it 'should redirect to the poll results page' do
      post :create, @params

      response.should redirect_to results_poll_path(@poll.uuid)
    end

    it 'should fail creating vote and render poll show' do
      @params[:vote]['option_id'] = nil

      expect { post :create, @params }.to_not change(Vote, :count)

      response.should render_template('polls/show')
    end

    it 'should 404 when poll does not exist' do
      @params[:vote]['poll_id'] = "#{@poll.id + 1}"

      expect { post :create, @params }.to raise_error(ActionController::RoutingError)
    end
  end
end