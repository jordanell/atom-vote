class Api::Slack::BaseController < ActionController::Base
  protect_from_forgery with: :null_session

  before_filter :set_seo_tags

  private

  def set_seo_tags
    set_meta_tags title: 'AtomVote',
                  description: 'Create a simple poll to share with the world.',
                  keywords: %w[Poll Vote Question Survey Atom AtomVote],
                  nofollow: true,
                  og:  {
                    title: 'AtomVote',
                    type:  'website',
                    url:   'http://atomvote.com',
                    image: 'https://s3.amazonaws.com/atomvote-production/meta/atom_vote_logo_64.png',
                  }
  end

  def render_error(code)
    @status_code = code

    respond_to do |format|
      format.html { render 'errors/show', status: code }
      format.json { render json: { message: 'An error has occurred' }, status: code }
    end
  end
end
