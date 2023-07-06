class Game 
  attr_reader :player1,
              :player2,
              :turn_counter

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @turn = Turn.new(@player1, @player2)
    @turn_counter = 0
  end  

  def start
    anouncement 
  end 

  def anouncement
    while @turn_counter < 1_000 && !game_over?
      @turn_counter += 1
      if @turn && @turn.type == :basic
        puts "Turn #{turn_counter}: #{@turn.winner.name} won #{@turn.award_spoils(@turn.winner).count} cards"
      elsif @turn && @turn.type == :war 
        puts "Turn #{turn_counter}: WAR - #{@turn.winner.name} won #{@turn.award_spoils(@turn.winner).count} cards"
      elsif @turn && @turn.type == :mutually_assured_destruction
        puts "Turn #{turn_counter}: *mutually assured destruction* 6 cards removed from play"
      end 
      @turn = Turn.new(@player1, @player2)
    end 
    if @turn_counter == 1_000
      puts "---- DRAW ----"
    elsif game_over?
      if game_winner
       puts "*~*~*~* #{game_winner.name} has won the game! *~*~*~*"
      else
        puts "The game ended in a draw."
      end
    end
  end 

  def game_over?
    @player1.has_lost? || @player2.has_lost?
  end

  def game_winner
    return @player1 if @player2.has_lost?
    return @player2 if @player1.has_lost?
    nil  # Return nil if the game is not over
  end

  def turn_type
    binding.pry
    @turn.type
  end 
  
  def turn_winner
    @turn.winner
  end 
  
  def pile_turn_cards
    @turn.pile_cards
  end 

  def award_winner 
    @turn.award_spoils(@turn.winner)
  end 
end 