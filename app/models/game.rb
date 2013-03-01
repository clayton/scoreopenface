require 'digest/sha2'
class Game < ActiveRecord::Base
  attr_accessible :players, :uuid
  before_create :gen_uuid
  
  has_many :scored_hands
  
  def to_param
    uuid
  end
  
  def player_scores
    totals = {}
    players_array.sort.each {|name| totals.merge!(name => 0)}
    scored_hands.each do |hand|
      hand.scores.each do |name, score|
        totals[name] += score.to_i
      end
    end
    totals
  end
  
  def players_title
    players_array.to_sentence
  end
  
  def players_array
    players.split(",").sort
  end
  
  def players_excluding(excluded)
    players_array.reject {|player| player == excluded}.sort
  end
  
  def organize_players(player1, player2, player3, player4)
    raw = []
    raw << player1.strip if player1.present?
    raw << player2.strip if player2.present?
    raw << player3.strip if player3.present?
    raw << player4.strip if player4.present?
    self.players = raw.join(',')
  end
  
private
  def gen_uuid
    self.uuid = Digest::SHA2.hexdigest(Time.now.to_i.to_s)[0...12]
  end
end
