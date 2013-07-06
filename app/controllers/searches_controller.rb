class SearchesController < ApplicationController
  def index
    @results = PgSearch.multisearch(params[:query])
      .paginate(:page => params[:page], :per_page => 10)
  end
end
