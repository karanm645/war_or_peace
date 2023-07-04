class Deck 
  attr_reader :cards_array,
              :high_ranking_cards

  def initialize(cards_array)
    @cards_array = cards_array 
    @high_ranking_cards = []
  end 

  def rank_of_card_at(index)
    @cards_array[index].rank
  end 

  def high_ranking_cards
    # use select method to easily pick
    @cards_array.select do |card|
      card.rank >= 11
    end 
    
    # iterate through cards and select the ones that have 11 or <
    # @cards_array.each do |card|
    #   if card.rank >= 11 
    #     @high_ranking_cards <<  card 
    #   end 
    # end 
    # @high_ranking_cards
  end 

  def percent_high_ranking
    # 2(high rank) / 3 (cards array)
    all_rank = []
    high = 0
    low = 0 

    @cards_array.each do |card|
      all_rank << card.rank 
    end 

    all_rank.each do |i|
      if i >= 11
        high += 1
      else 
        low += 1
      end 
    end 

    #percentage = high cards / all cards
    percentage = (high.to_f / @cards_array.count.to_f) * 100
    percentage.round(2)
  end 

  def add_card(card)
    @cards_array << card 
  end 
  def removed_card
    #remove top card --> shift + 1st one
    first_card = @cards_array.shift(1)

    return first_card.pop # remove from array
  end 

  def remove_three_cards
    card_holder = []
    3.times { card_holder << @cards_array.shift(1)}

    return card_holder.flatten
  end 

  def mod_remove_three_cards
    3.times do @cards_array.shift(1)
    end 
  end 
end 