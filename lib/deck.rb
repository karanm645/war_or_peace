class Deck 
  attr_reader :cards_array

  def initialize(cards_array)
    @cards_array = cards_array 
  end 

  def rank_of_card_at(index)
    @cards_array[index].rank
  end 
end 