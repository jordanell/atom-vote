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

    it 'should create the poll (json)' do
      @params[:format] = 'json'

      expect { post :create, @params }.to change(Poll, :count).by(1)
    end

    it 'should redirect to the poll show page' do
      post :create, @params

      response.should redirect_to poll_path(assigns(:poll).uuid)
    end

    it 'should render poll json' do
      @params[:format] = 'json'

      post :create, @params

      json_response['poll']['uuid'].should_not be_nil
    end

    it 'should fail creating poll and render new' do
      @params[:poll]['question'] = ''

      expect { post :create, @params }.to_not change(Poll, :count)

      response.should render_template('polls/new')
    end

    it 'should fail and pad up to four options when less than 4 are supplied' do
      @params[:poll]['question'] = ''

      post :create, @params

      controller.instance_variable_get(:@poll).options.length.should eq(4)
    end

    it 'should fail and pad up to options+1 when more than 3 are supplied' do
      @params[:poll]['question'] = ''
      @params[:poll][:options_attributes]['2'] = {}
      @params[:poll][:options_attributes]['2']['text'] = 'Option 3'
      @params[:poll][:options_attributes]['3'] = {}
      @params[:poll][:options_attributes]['3']['text'] = 'Option 4'

      post :create, @params

      controller.instance_variable_get(:@poll).options.length.should eq(5)
    end

    it 'should fail creating poll and render json' do
      @params[:format] = 'json'
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

    it 'assigns @vote' do
      get :show, @params

      expect(assigns(:vote)).to be_kind_of(Vote)
    end

    it 'should show the poll' do
      get :show, @params

      expect(assigns(:poll)).to be_kind_of(Poll)
      response.should render_template('polls/show')
    end

    it 'should show the poll (json)' do
      @params[:format] = 'json'

      get :show, @params

      json_response['poll']['uuid'].should eq(@poll.uuid)
    end

    it 'should redirect to the results if you have already voted' do
      @vote = FactoryGirl.create(:vote, poll: @poll, voter_uuid: 'my-session')
      session.id = 'my-session'

      get :show, @params

      response.should redirect_to(results_poll_path(@poll.uuid))
    end

    it 'should 404 when poll does not exist' do
      @params = { id: '' }

      get :show, @params

      response.should render_template('errors/show')
    end

    it 'should 404 when poll does not exist (json)' do
      @params = { id: '', format: 'json' }

      get :show, @params

      json_response['message'].should eq('An error has occurred')
      response.code.should eq('404')
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

      get :results, @params

      response.should render_template('errors/show')
    end
  end
end