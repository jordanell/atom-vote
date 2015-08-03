require 'rails_helper'

describe 'pages/show.html.erb' do
  context 'with slug instance variable' do
    before(:each) do
      @slug = 'terms'
    end

    it 'should display the page' do
      render

      rendered.should have_selector('div.page-wrapper')
    end
  end

  context 'without slug instance variable' do
    it 'should fail to render the template' do
      expect{render}.to raise_error(ActionView::Template::Error)
    end
  end
end