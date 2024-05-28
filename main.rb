# one super class PLAYER that will have the attribute health.
class PLAYER
  attr_accessor :health
  def initialize
    @health = 3
  end
end
# one sub class called PLAYER1 that will inherit from PLAYER
class PLAYER1 < PLAYER
  def initialize
    super
  end
end

# one sub class called PLAYER2 that will inherit from PLAYER
class PLAYER2 < PLAYER
  def initialize
    super
  end
end

# one class called GAME
class Game
  attr_accessor :player1, :player2, :current_player
  
  def initialize
    @player1 = PLAYER1.new
    @player2 = PLAYER2.new
    @current_player = player1
  end

  def start_game
    while player1.health > 0 && player2.health > 0
      check_number
      check_health
      switch_players
    end
  end
  
  # this class will have the ability to ask the player to choose two numbers between 1-20
  def choose_numbers
    puts "#{current_player.class} Choose two numbers between 1-20"
    numbers = gets.chomp.split.map(&:to_i)
    numbers
  end

  # this class will have the ability to check if the player's number is equal to the random number
  def check_number
    numbers = choose_numbers
    result = numbers[0] + numbers[1]
    puts "#{current_player.class} What is #{numbers[0]} + #{numbers[1]}?"
    answer = gets.chomp.to_i
    if answer == result
      puts "You are correct!"
    else
      puts "You are wrong! You lose one health point."
      current_player.health -= 1
    end
  end

  # this class will have the ability to check if the player's health is equal to 0
  def check_health
    if current_player.health == 0
      puts "You have lost!"
    else 
      puts "P1: #{player1.health}/3 vs P2: #{player2.health}/3"
      puts "----- NEW TURN -----"
    end
  end

  # this class will have the ability to switch players
  def switch_players
    self.current_player = current_player == player1 ? player2 : player1
  end
end

game = Game.new
game.start_game
