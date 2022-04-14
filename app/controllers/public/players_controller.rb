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
    @posts = @player.posts
  end
  
  def unsubscribe
     @player = current_player
  end
  
  def withdraw
    @player = current_player
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @player.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to "/"
  end
  
  private
  
  def player_params
    params.require(:player).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :area, :team_url, :email, :introduce, :sport_id, :image, :team_name)
  end
end
