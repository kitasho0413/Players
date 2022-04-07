class Public::PlayersController < ApplicationController
  def new
  end

  def edit
    @player = current_player
  end
  
  def update
    @player = current_player
    @player.update(player_params)
    redirect_to player_path(current_player.id)
  end

  def index
    @players = Player.all
  end

  def show
    @player = current_player
  end
  
  private
  
  def player_params
    params.require(:player).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :area, :team_url, :email, :introduce)
  end
end
