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

    it 'should create the vote (json)' do
      @params[:format] = 'json'

      expect { post :create, @params }.to change(Vote, :count).by(1)
    end

    it 'should redirect to the poll results page' do
      post :create, @params

      response.should redirect_to results_poll_path(@poll.uuid)
    end

    it 'should render vote json' do
      @params[:format] = 'json'

      post :create, @params

      json_response['vote']['voter_uuid'].should_not be_nil
    end

    it 'should fail creating vote and render poll show' do
      @params[:vote]['option_id'] = nil

      expect { post :create, @params }.to_not change(Vote, :count)

      response.should render_template('polls/show')
    end

    it 'should fail creating poll and render json' do
      @params[:format] = 'json'
      @params[:vote]['option_id'] = nil

      post :create, @params

      json_response['message'].should eq('Vote creation failed')
    end

    it 'should 404 when poll does not exist' do
      @params[:vote]['poll_id'] = "#{@poll.id + 1}"

      post :create, @params

      response.should render_template('errors/show')
    end

    it 'should 404 when poll does not exist (json)' do
      @params[:format] = 'json'
      @params[:vote]['poll_id'] = "#{@poll.id + 1}"

      post :create, @params

      json_response['message'].should eq('An error has occurred')
      response.code.should eq('404')
    end
  end
end