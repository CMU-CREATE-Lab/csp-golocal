class KeywordsController < ApplicationController
  def index
  end

  def new
  end

  def edit
    @keyword = Keyword.find(params[:id])
  end

  def create
    render :inline => "create"
  end
  def update
    render :inline => "update"
  end
  def destroy
    render :inline => "destroy"
  end
end
