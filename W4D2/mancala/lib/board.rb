require "byebug"
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14){Array.new}
    place_stones
  end

  def place_stones
    @cups.each_with_index do |cup, idx|
      if idx !=6 && idx !=13
        4.times do 
          cup << :stone
        end
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if !start_pos.between?(0,13)
    raise "Starting cup is empty" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    valid_move?(start_pos)
    num_stones = @cups[start_pos].size
    distribute_stones(start_pos, num_stones)
    
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def distribute_stones(pos, num_stones)
    pos.between?(0,5) ? opponent_cup_index = 6 : opponent_cup_index = 13 
    @cups[pos] = []
    i=(pos+1)%14
    while num_stones > 0
      # debugger
      current_cup = @cups[i]
      if i == opponent_cup_index
        i = (i+1) % 14
        next
      end
      current_cup << :stone
      i = (i+1)%14
      num_stones-=1
    end
  end


  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end
