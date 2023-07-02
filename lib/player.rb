class Player 
  attr_reader :name,
              :deck 

  def initialize(name, deck)
    @name = name 
    @deck = deck 
  end 

  def has_lost?
    deck.cards_array.empty?
  end 
end 