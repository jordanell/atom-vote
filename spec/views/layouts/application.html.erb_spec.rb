require 'rails_helper'

describe 'layouts/application.html.erb' do
  it 'should render the layout' do
    expect { render }.to_not raise_error
  end

  it 'should render the header' do
    render

    rendered.should render_template(partial: 'shared/_header')
  end

  it 'should render the footer' do
    render

    rendered.should render_template(partial: 'shared/_footer')
  end
end
