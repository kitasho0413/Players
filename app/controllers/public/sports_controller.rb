class Public::SportsController < ApplicationController
  def index
    @sports = Sport.all.page(params[:page]).per(12)
    if Rails.env.production?
      @randoms = Post.order("RAND()").limit(5)
      #mysql
    else
      @randoms = Post.order("RANDOM()").limit(5)
      #sqlite
    end
  end
  
  def show
    @sport = Sport.find(params[:id])
    @players = @sport.players.page(params[:page]).per(12)
  end
  
  private
  
  def sport_params
    params.require(:sport).permit(:sport_name)
  end
  
  def player_params
    params.require(:player).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :area, :team_url, :email, :introduce, :sport_id, :image, :team_name)
  end
end
