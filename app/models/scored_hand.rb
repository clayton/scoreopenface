class ScoredHand < ActiveRecord::Base
  attr_accessible :game_id, :scores
  
  belongs_to :game
  
  serialize :scores, Hash
  
  def calculate_score(hand)
    scored_hand = {}
    hand.keys.each {|name| scored_hand.merge!(name => 0)}
    hand.each do |player, payees|
      scored_hand[player] -= payees.collect{|name, owed| owed.to_i}.sum
      payees.each do |name, owed|
        scored_hand[name] += owed.to_i
      end
    end
    self.scores = scored_hand
  end
end
