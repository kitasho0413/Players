class Public::PostsController < ApplicationController
  before_action :autheniticate_player, except: [:show]
  
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
    @post_comments = @post.post_comments.page(params[:page]).per(8)
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
