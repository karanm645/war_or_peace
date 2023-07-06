class CardGenerator
  attr_reader :all_the_cards,
              :split_cards 

  def initialize()
    @all_the_cards = all_the_cards
    @split_cards = split_cards 
  end 

  def all_the_cards
    total_cards = []  

    suits = [:spade, :heart, :diamond, :club]
    values = ["two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "jack", "qeen", "king", "ace"]
    ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
    suits.each do |suit|
      ranks.size.times do |r|
        total_cards << Card.new(suit, values[r], r) 
      end 
    end 
    total_cards.shuffle 
  end 

  def split_cards 
    all_the_cards.each_slice(26).to_a
  end 

end 