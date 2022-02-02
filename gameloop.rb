class Game

  def initialize(name)
    @name = name
    @player_1 = Players.new('Player 1')
    @player_2 = Players.new('Player 2')
  end

  def start
    puts "New Game Started...Welcome #{@player_1.name} and #{@player_2.name}."
    turn
  end

  def show_remaining_lives
    puts "P1: #{@player_1.lives}/3 vs P2: #{@player_2.lives}/3"
  end

  def check_lives
    if @player_1.dead?
      winner(@player_2)
    elsif @player_2.dead?
      winner(@player_1)
    end
  end

  def winner(player)
    puts "#{player.name} wins with a score of #{player.lives}/3"
    puts "------GAME-OVER--------------------"
    puts "Goodbye!"
    exit(0)
  end

  def turn
    @player_1.new_question
    check_lives
    @player_2.new_question
    check_lives
    show_remaining_lives
    puts "-------NEW-TURN---------------------"
    turn
  end

end