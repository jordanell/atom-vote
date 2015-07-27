require 'rails_helper'

RSpec.describe PollsController, type: :controller do
  describe 'new' do
    it 'assigns @poll' do
      poll = Poll.new

      get :new

      expect(assigns(:poll)).to be_kind_of(Poll)
    end
  end
end