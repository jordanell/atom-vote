require 'rails_helper'

RSpec.describe Api::V1::PollsController, type: :controller do
  describe '#create' do
    before(:each) do
      @params = {
        'poll': {
          'question': 'My test poll question',
          'options_attributes': {
            '0': {
              text: 'Option 1'
            },
            '1': {
              text: 'Option 2'
            }
          }
        }
      }
    end

    it 'should create the poll' do
      expect { post :create, @params }.to change(Poll, :count).by(1)
    end

    it 'should render poll json' do
      post :create, @params

      json_response['uuid'].should_not be_nil
    end

    it 'should fail creating poll and render 422' do
      @params[:poll]['question'] = ''

      expect { post :create, @params }.to_not change(Poll, :count)

      response.status.should eq(422)
    end

    it 'should fail creating poll and render correct message' do
      @params[:poll]['question'] = ''

      post :create, @params

      json_response['message'].should eq('Poll creation failed')
    end
  end

  describe '#show' do
    before(:each) do
      @poll = FactoryGirl.create(:poll)

      @params = { id: @poll.uuid }
    end

    it 'should show the poll' do
      get :show, @params

      json_response['uuid'].should eq(@poll.uuid)
    end

    it 'should 404 when poll does not exist' do
      @params = { id: '' }

      get :show, @params

      response.status.should eq(404)
    end
  end
end