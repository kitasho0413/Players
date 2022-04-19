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
    #@posts = current_user.posts.page(params[:page])
    @posts = @player.posts.page(params[:page]).per(8)
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
  
  def favorites
    @player = Player.find(params[:id])
    favorites= Favorite.where(player_id: @player.id).pluck(:post_id)
    @favorite_posts = Post.find(favorites)
  end
  
  def check_players
    player = Player.find(params[:player_id])
    @players = player.followings.page(params[:page]).per(12)
  end
  
  private
  
  def player_params
    params.require(:player).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :area, :team_url, :email, :introduce, :sport_id, :image, :team_name)
  end
end
