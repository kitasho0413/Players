class Public::RelationshipsController < ApplicationController
# フォローするとき
  def create
    current_player.follow(params[:player_id])
    redirect_to request.referer
  end
  # フォロー外すとき
  def destroy
    current_player.unfollow(params[:player_id])
    redirect_to request.referer  
  end
  # フォロー一覧
  def followings
    player = Player.find(params[:player_id])
    @players = player.followings
  end
  # フォロワー一覧
  def followers
    player = Player.find(params[:player_id])
    @players = player.followers
  end
end
