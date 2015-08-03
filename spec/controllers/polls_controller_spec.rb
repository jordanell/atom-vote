require 'rails_helper'

RSpec.describe PollsController, type: :controller do
  describe '#new' do
    it 'assigns @poll' do
      poll = Poll.new

      get :new

      expect(assigns(:poll)).to be_kind_of(Poll)
    end
  end

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

    it 'should redirect to the poll show page' do
      post :create, @params

      response.should redirect_to poll_path(assigns(:poll).uuid)
    end

    it 'should fail creating poll and render new' do
      @params[:poll]['question'] = ''

      expect { post :create, @params }.to_not change(Poll, :count)

      response.should render_template('polls/new')
    end
  end

  describe '#show' do
    before(:each) do
      @poll = FactoryGirl.create(:poll)

      @params = { id: @poll.uuid }
    end

    it 'assigns @vote' do
      get :show, @params

      expect(assigns(:vote)).to be_kind_of(Vote)
    end

    it 'should show the poll' do
      get :show, @params

      expect(assigns(:poll)).to be_kind_of(Poll)
      response.should render_template('polls/show')
    end

    it 'should 404 when poll does not exist' do
      @params = { id: '' }

      expect { get :show, @params }.to raise_error(ActionController::RoutingError)
    end
  end

  describe '#results' do
    before(:each) do
      @poll = FactoryGirl.create(:poll)

      @params = { id: @poll.uuid }
    end

    it 'should show the poll results' do
      get :results, @params

      expect(assigns(:poll)).to be_kind_of(Poll)
      response.should render_template('polls/results')
    end

    it 'should 404 when poll does not exist' do
      @params = { id: '' }

      expect { get :results, @params }.to raise_error(ActionController::RoutingError)
    end
  end
end