require 'rails_helper'

RSpec.describe 'errors', type: :request do

  it 'displays the error page' do
    get '/404'

    response.should render_template('errors/show')
  end

  it 'displays the correct error number' do
    get '/404'

    response.body.should include('404')
  end
end