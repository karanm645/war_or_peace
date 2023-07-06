require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
require './lib/card_generator'
require 'pry'

RSpec.describe Game do
  before(:each) do 
    @all_cards = CardGenerator.new.all_the_cards
    @split_cards = CardGenerator.new.split_cards

    @deck1 = Deck.new(@split_cards[0])
    @deck2 = Deck.new(@split_cards[1])
 
    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)
    @game = Game.new(@player1, @player2)

  end 

  it "turn type is determined" do 
    binding.pry
    expect(@game.turn.type).to eq(:basic)
  end 
  
  it "winner is determined" do 
    expect(@game.turn_winner).to eq(@player1)
    
  end 
  
  xit "players cards are sent to spoils of war" do 
    @game.pile_turn_cards 

    expect(@turn.spoils_of_war).to eq([@card1, @card3])
    expect(@game.spoils_of_war).to eq([@card1, @card3])

    expect(@game.award_winner).to eq(@turn.award_spoils(@turn.winner))
    expect(@game.pile_turn_cards).to eq(@turn.pile_cards)
  end 

  xit "awards goes to winner" do 
  end 
end 