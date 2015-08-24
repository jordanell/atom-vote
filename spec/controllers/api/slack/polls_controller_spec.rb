require 'rails_helper'

RSpec.describe Api::Slack::PollsController, type: :controller do
  describe '#create' do
    before(:each) do
      @params = { format: 'json', text: 'What option? 1. One 2. Two' }
    end

    it 'should create the poll' do
      expect { post :create, @params }.to change(Poll, :count).by(1)
    end

    it 'should render poll json' do
      post :create, @params

      response.body.should match('polls')
    end

    it 'should fail creating poll and render json' do
      @params[:text] = ''

      post :create, @params

      response.body.should eq('Poll creation failed')
    end
  end
end