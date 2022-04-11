class Public::PlayersController < ApplicationController
  def new
  end

  def edit
    @player = Player.find(params[:id])
  
  end
  
  def update
    @player = Player.find(params[:id])
    @player.update!(player_params)
    redirect_to player_path(current_player.id)
  end

  def index
    @players = Player.all
  end

  def show
    @player = Player.find(params[:id])
    @posts = Post.all
  end
  
  private
  
  def player_params
    params.require(:player).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :area, :team_url, :email, :introduce, :sport_id, :image)
  end
end
