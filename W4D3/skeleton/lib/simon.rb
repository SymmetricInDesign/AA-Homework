class Simon
  @@COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over
      self.take_turn
    end
    self.game_over_message
    self.reset_game
  end

  def take_turn
    self.show_sequence
    self.require_sequence
    if !@game_over
      self.round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    self.add_random_color
    puts @seq
  end

  def require_sequence
    i=0
    until i == sequence_length
      puts "enter the #{i==0 ? "first" : "next"} color in the sequence"
      input = gets.chomp.downcase
      if input != @seq[i] 
        @game_over = true
        break
      end
      i+=1
    end
  end

  def add_random_color
    @seq << @@COLORS.sample
  end

  def round_success_message
    puts "congratulations, you completed a round."
  end

  def game_over_message
    puts "Game Over!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

simon = Simon.new
simon.play