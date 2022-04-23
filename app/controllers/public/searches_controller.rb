class Public::SearchesController < ApplicationController

  def search
    @range = params[:range]
    @players = Player.looks(params[:search], params[:word])
    render :search_result, players: @players
  end
  
  def search_result
  end
end
