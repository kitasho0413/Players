class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.player_id = current_player.id
    @post.save
    redirect_to player_path(current_player.id)
  end
  
  def edit
  end

  def show
    @post = Post.find(params[:id])
    @player = Player.find(@post.player_id)
    @post_comment = PostComment.new
  end
  
  def destroy
    post = Post.find(params[:id])
    post.destroy  
    redirect_to player_path(current_player)
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title, :about, :video, :image)
  end
end
