require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require 'pry'

RSpec.describe Player do 
  before(:each) do 
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @cards_array = [@card1, @card2, @card3]
    @deck = Deck.new(@cards_array)

    @player = Player.new('Clarisa', @deck)
  end 

  it "has a name" do 
    expect(@player.name).to eq("Clarisa")
  end 

  it "has a deck" do 
    expect(@player.deck).to eq(@deck)
  end 

  it "can tell if player has no cards and lost" do 
    expect(@player.has_lost?).to eq(false)
  end 

  it "can remove a card from the deck" do 
    expect(@player.deck.removed_card).to eq(@card1)
    expect(@player.has_lost?).to eq(false)
    expect(@player.deck.removed_card).to eq(@card2)
    expect(@player.has_lost?).to eq(false)
    expect(@player.deck.removed_card).to eq(@card3)
    expect(@player.has_lost?).to eq(true)

    expect(@player.deck.cards_array).to eq([])
  end 
end 