class SearchesController < ApplicationController
  def show
    
  end
  def new
    @search = Search.new
  end

  private
  def set_search
    @user = Search.find(params[:id])
  end

  def search_params
    params.require(:search).permit(:name)
  end
end
