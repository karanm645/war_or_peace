require 'rspec'
require './lib/card'
require './lib/deck'
require 'pry'

RSpec.describe Deck do
  before(:each) do 
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @cards_array = [@card1, @card2, @card3]
    @deck = Deck.new(@cards_array)
  end 
  it "has an array of cards" do

    expect(@deck.cards_array).to eq(@cards_array)
  end 

  it "can find rank by indexing" do 

    expect(@deck.rank_of_card_at(0)).to eq(12)
    expect(@deck.rank_of_card_at(2)).to eq(14)
  end 

  it "can calculate the high ranking cards of rank 11 <" do 
    expect(@deck.high_ranking_cards).to eq([@card1, @card3])
  end 

  it "can calculate the percentage of cards that are high ranking" do 
  
    expect(@deck.percent_high_ranking).to eq(66.67)
  end 
  it "can remove and return a card from the deck" do
    removed_card = @card1

    expect(@deck.removed_card).to eq(removed_card)
    expect(@deck.high_ranking_cards).to eq([@card3])
    expect(@deck.percent_high_ranking).to eq(50.00)

    card4 = Card.new(:club, '5', 5)

    @deck.add_card(card4)

    expect(@deck.cards_array).to eq([@card2, @card3, card4])
    expect(@deck.high_ranking_cards).to eq([@card3])
    expect(@deck.percent_high_ranking).to eq(33.33)
  end 
end 