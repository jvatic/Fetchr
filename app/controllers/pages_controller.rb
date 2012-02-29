class PagesController < ApplicationController
  # GET /pages/1
  # GET /pages/1.json
  def show
    @page = Page.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @page }
    end
  end

  # GET /pages/new
  # GET /pages/new.json
  def new
    @page = Page.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @page }
    end
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = Scraper.fetch(params[:page][:url])

    if @page
      redirect_to @page
    else
      flash[:error] = "Failed to fetch url! Please check the url and try again."
      redirect_to :action => :new
    end
  end
end
