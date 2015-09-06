require 'rails_helper'

describe 'shared/_banner_ad.html.erb' do
  it 'should render the ad' do
    render partial: 'shared/banner_ad'

    rendered.should have_selector('section.banner-ad')
  end
end
