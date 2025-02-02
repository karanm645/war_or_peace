require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require 'pry'

RSpec.describe Turn do 
  describe "basic turn" do 
      before(:each) do 
    @card1 = Card.new(:heart, 'Jack', 11)
    @card2 = Card.new(:heart, '10', 10) 
    @card3 = Card.new(:heart, '9', 9)  
    @card4 = Card.new(:diamond, 'Jack', 11)  
    @card5 = Card.new(:heart, '8', 8) 
    @card6 = Card.new(:diamond, 'Queen', 12) 
    @card7 = Card.new(:heart, '3', 3) 
    @card8 = Card.new(:diamond, '2', 2)

    @deck1 = Deck.new([@card1, @card2, @card5, @card8]) 
    @deck2 = Deck.new([@card3, @card4, @card6, @card7])

    @player1 = Player.new("Megan", @deck1) 
    @player2 = Player.new("Aurora", @deck2)

    @turn = Turn.new(@player1, @player2)
  end 
    it "can identify player name" do 
      expect(@turn.player1).to eq(@player1)
      expect(@turn.player2).to eq(@player2)
    end 
  
    it "has a spoils of war" do 
      expect(@turn.spoils_of_war).to eq([])
    end 

    it "has a basic type of turn" do 
      expect(@turn.type).to eq(:basic)
    end 

    it "can determine the turns winner" do 
      winner = @turn.winner

      expect(winner).to eq(@player1)
    end 

    it " both players send top card to spoils of war" do 
      @turn.pile_cards

      expect(@turn.spoils_of_war).to eq([@card1, @card3])
    end 

    it "adds each spoils_of_war cards to winner deck" do 
      winner = @turn.winner
      
      @turn.award_spoils(winner)

      expect(@player1.deck.cards_array).to eq([@card2, @card5, @card8, @card1, @card3])
      expect(@player2.deck.cards_array).to eq([@card4, @card6, @card7])
    end 
  end 

  describe "turn type war" do 
    before(:each) do 
      @card1 = Card.new(:heart, 'Jack', 11)
      @card2 = Card.new(:heart, '10', 10) 
      @card3 = Card.new(:heart, '9', 9)  
      @card4 = Card.new(:diamond, 'Jack', 11)  
      @card5 = Card.new(:heart, '8', 8) 
      @card6 = Card.new(:diamond, 'Queen', 12) 
      @card7 = Card.new(:heart, '3', 3) 
      @card8 = Card.new(:diamond, '2', 2)

      @deck1 = Deck.new([@card1, @card2, @card5, @card8]) 
      @deck2 = Deck.new([@card4, @card3, @card6, @card7])

      @player1 = Player.new("Megan", @deck1) 
      @player2 = Player.new("Aurora", @deck2)

      @turn = Turn.new(@player1, @player2)
    end 

    it "has a turn type war" do 
      expect(@turn.type).to eq(:war)
    end 

    it "has a winner in the war turn" do 
      winner = @turn.winner 
      expect(winner).to eq(@player2)
    end 

    it "can take each players first three cards and send them to the spoils of war" do 
      @turn.pile_cards 
      expect(@turn.spoils_of_war).to eq([@card1, @card2, @card5, @card4, @card3, @card6])
    end 

    it "adds each spoils_of_war cards to winner deck" do 
      winner = @turn.winner
      
      @turn.award_spoils(winner)

      expect(@player1.deck.cards_array).to eq([@card8])
      expect(@player2.deck.cards_array).to eq([@card7, @card1, @card2, @card5, @card4, @card3, @card6])
    end 
  end


  describe "turn type MOD" do 
    before(:each) do 
      @card1 = Card.new(:heart, 'Jack', 11)
      @card2 = Card.new(:heart, '10', 10) 
      @card3 = Card.new(:heart, '9', 9)  
      @card4 = Card.new(:diamond, 'Jack', 11)  
      @card5 = Card.new(:heart, '8', 8) 
      @card6 = Card.new(:diamond, '8', 8) 
      @card7 = Card.new(:heart, '3', 3)
      @card8 = Card.new(:diamond, '2', 2) 
      
      @deck1 = Deck.new([@card1, @card2, @card5, @card8]) 
      @deck2 = Deck.new([@card4, @card3, @card6, @card7])

      @player1 = Player.new("Megan", @deck1) 
      @player2 = Player.new("Aurora", @deck2)

      @turn = Turn.new(@player1, @player2)
    end 

    it "has a turn type mod" do 
      expect(@turn.type).to eq(:mutually_assured_destruction)
    end 

    it "doesnt have a winner in the mod turn" do 
      winner = @turn.winner
      expect(winner).to eq("No Winner")
    end 

    it "has nothing in spoils of war" do 
      @turn.pile_cards 
      expect(@turn.spoils_of_war).to eq([])
    end 

    it "shows the cards in each players deck after mod" do 
      @turn.pile_cards 
      expect(@turn.spoils_of_war).to eq([])

      expect(@player1.deck.cards_array).to eq([@card8])
      expect(@player2.deck.cards_array).to eq([@card7])
    end 
  end


end 