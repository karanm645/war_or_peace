require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
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

describe "game config" do 
    before(:each) do 
      @all_cards_array = []
      @deck = Deck.new(@all_cards_array)
      
      @suits = [:spade, :heart, :diamond, :club]
      @values = ["two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "jack", "qeen", "king", "ace"]
      @ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
      
      @suits.each do |suit|
        @ranks.size.times do |r|
            @all_cards_array << Card.new(suit, @values[r], r) 
        end 
      end 
    end 
    it 'has a full stack of cards and can split and randomize' do 
      
      # expect(@deck.all_cards).to eq(@all_cards_array)
      expect(@deck.all_cards.size).to eq(52)
      expect(@deck.split_cards.size).to eq(2)
    end

    it "has 2 players with one deck each" do 
      full_deck = @deck.split_cards 

      deck1 = full_deck[0]
      deck2 = full_deck[1]
      
      player1 = Player.new("Megan", deck1) 
      player2 = Player.new("Aurora", deck2)

    end  
  end 
end 