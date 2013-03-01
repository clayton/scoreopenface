class ScoredHandsController < ApplicationController
  def create
    @game = Game.find_by_uuid(params[:game_id])
    @scored_hand = @game.scored_hands.new
    @scored_hand.calculate_score(params[:hand])
    @scored_hand.save
    redirect_to game_url(@game)
  end
end
