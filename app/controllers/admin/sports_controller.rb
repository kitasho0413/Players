class Admin::SportsController < ApplicationController
  
  def index
    @sports = Sport.all
    @sport = Sport.new
  end
  
  def create
    sport = Sport.new(sport_params)
    sport.save
    redirect_to admin_sports_path
  end
  
  def destroy
    sport = Sport.find(params[:id])
    sport.destroy
    redirect_to admin_sports_path
  end
  
  private
  
  def sport_params
    params.require(:sport).permit(:sport_name)
  end
end
