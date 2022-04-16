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
    
  end
  
  private
  
  def sport_params
    params.require(:sport).permit(:sport_name)
  end
end
