class Turn 
  attr_reader :player1,
              :player2,
              :spoils_of_war
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2 
    @spoils_of_war = []
  end 

  def type 
    if first_card_equal && third_card_equal
      return :mutually_assured_destruction
    elsif player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      return :basic 
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      return :war
    end 
  end 

  def winner 
    if type == :basic 
      basic_winner
    elsif type == :war  
      war_winner 
    elsif type == :mutually_assured_destruction
      "No Winner"
    end 
  end 

  def pile_cards
    if type == :basic 
      basic_pile
    elsif type == :war 
      war_pile 
    elsif type == :mutually_assured_destruction
      mad_pile_remove
    end 
  end 

  def award_spoils(winner)
    pile_cards.each do |card|
      winner.deck.cards_array << card
    end 
  end 

  #### helper methods ###############

  # *type helper methods
  def first_card_equal
    player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
  end 

  def third_card_equal
    player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
  end
  #

  # *winner helper methods
  def basic_winner
    if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
      player1
    else 
      player2 
    end 
  end 

  def war_winner
    if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
      player1
    else 
      player2 
    end 
  end 
  #

  # pile cards helper methods
  def basic_pile
    spoils_of_war.push(player1.deck.removed_card, player2.deck.removed_card) 
  end 

  def war_pile
  pile = spoils_of_war.push(player1.deck.remove_three_cards, player2.deck.remove_three_cards) 
  pile.flatten!
  end 

  def mad_pile_remove
    player1.deck.mad_remove_three_cards
    player2.deck.mad_remove_three_cards
  end 
  #
end 