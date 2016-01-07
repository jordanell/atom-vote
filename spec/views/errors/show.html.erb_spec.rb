require 'rails_helper'

describe 'errors/show.html.erb' do
  context 'with status_code instance variable' do
    before(:each) do
      @status_code = 404
    end

    it 'should display the page' do
      render

      rendered.should have_selector('div.error-page-wrapper')
    end

    it 'should display the error code' do
      render

      rendered.should have_content(@status_code)
    end
  end
end
