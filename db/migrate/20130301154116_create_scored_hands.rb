class CreateScoredHands < ActiveRecord::Migration
  def change
    create_table :scored_hands do |t|
      t.integer :game_id
      t.text :scores

      t.timestamps
    end
  end
end
