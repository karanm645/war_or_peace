require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/card_generator'
require 'pry'

RSpec.describe CardGenerator do 
  before(:each) do 
    # @deck = Deck.new(@total_cards)
    @card_generator = CardGenerator.new
  end 
  it "creates 52 cards" do 
    expect(@card_generator.all_the_cards.size).to eq(52)
  end 

  it "can split the 52 cards" do
    expect(@card_generator.split_cards.size).to eq(2)
  end 

  it "has two players with the new decks" do 
      full_deck = @card_generator.split_cards 

      deck1 = full_deck[0]
      deck2 = full_deck[1]
      
      player1 = Player.new("Megan", deck1) 
      player2 = Player.new("Aurora", deck2)

      expect(player1.name).to eq("Megan")
      expect(player1.deck.size).to eq(26)
  end 
end 