class Public::SportsController < ApplicationController
  def index
    @sports = Sport.all
  end
  
  def show
    @sport = Sport.find(params[:id])
  end
  
  private
  
  def sport_params
    params.require(:sport).permit(:sport_name)
  end
end
