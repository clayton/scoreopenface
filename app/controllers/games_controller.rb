class GamesController < ApplicationController
  def new
    @game = Game.new
  end
  
  def create
    @game = Game.new
    @game.organize_players(params[:player_1], params[:player_2], params[:player_3], params[:player_4])
    @game.save
    redirect_to game_url(@game)
  end
  
  def update
    
  end
  
  def show
    @game = Game.find_by_uuid(params[:id])
    @scored_hand = @game.scored_hands.new
  end
end
