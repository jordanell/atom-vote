class PagesController < ApplicationController
  before_filter :fetch_page, only: [:show]

  def show
  end

  private

  def fetch_page
    @slug = params[:id]
    @page = lookup_context.exists?("pages/_#{params[:id]}")

    unless @page
      # TODO: change this to custom 404 page.
      raise ActionController::RoutingError.new('Not Found')
    end
  end
end
