class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end
  
  def create
    post = Post.new(post_params)
    post.save
    redirect_to player_path(current_player.id)
  end
  
  def edit
  end

  def show
  end
  
  def destroy
    post = Post.find(params[:id])
    post.destroy  
    redirect_to player_path(player.id)
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title, :about, :video, :image)
  end
end
