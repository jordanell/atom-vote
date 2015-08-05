class PagesController < ApplicationController
  before_filter :fetch_page, only: [:show]

  def show
  end

  private

  def fetch_page
    @slug = params[:id]
    @page = lookup_context.exists?("pages/_#{params[:id]}")

    unless @page
      return render_error(404)
    end
  end
end
