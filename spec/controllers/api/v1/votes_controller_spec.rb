require 'rails_helper'

RSpec.describe Api::V1::VotesController, type: :controller do
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

    it 'should return success' do
      post :create, @params

      response.status.should eq(201)
    end

    it 'should create the vote' do
      expect { post :create, @params }.to change(Vote, :count).by(1)
    end

    it 'should return the vote' do
      post :create, @params

      json_response['voter_uuid'].should_not be_nil
    end

    it 'should return 422' do
      @params[:vote]['option_id'] = nil

      post :create, @params

      response.status.should eq(422)
    end

    it 'should fail creating poll' do
      @params[:vote]['option_id'] = nil

      expect { post :create, @params }.to_not change(Vote, :count)
    end

    it 'should render correct message' do
      @params[:vote]['option_id'] = nil

      post :create, @params

      json_response['message'].should eq('Vote creation failed')
    end

    it 'should 404 when poll does not exist' do
      @params[:vote]['poll_id'] = "#{@poll.id + 1}"

      post :create, @params

      json_response['message'].should eq('An error has occurred')
      response.status.should eq(404)
    end
  end
end