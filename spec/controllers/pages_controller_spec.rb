require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe '#show' do
    before(:each) do
      @params= { id: 'terms' }
    end

    it 'assigns @slug' do
      get :show, @params

      expect(assigns(:slug)).to be_kind_of(String)
    end

    it 'should show the pages template' do
      get :show, @params

      response.should render_template('pages/show')
    end

    it 'should 404 when page does not exist' do
      expect { get :show, { id: 'wrongslug' } }.to raise_error(ActionController::RoutingError)
    end
  end
end