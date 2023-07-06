class Card 
  attr_reader :suit,
              :value,
              :rank 

  def initialize(suit, value, rank)
    @suit = suit
    @value = value
    @rank = rank
  end 
end 

# move over deck method in test that has all cards attribute values to here
