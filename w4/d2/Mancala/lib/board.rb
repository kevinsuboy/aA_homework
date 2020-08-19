require 'byebug'
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14){[]}
    self.place_stones
    @name1, @name2 = name1, name2
    # NOTE: associate name1 with cup 0, name2 with cup 13
  end
  
  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups[0..5]  = 6.times.map{|i| 4.times.map{|j| :stone}}
    @cups[7..-2] = 6.times.map{|i| 4.times.map{|j| :stone}}
  end
  
  def valid_move?(start_pos)
    raise 'Invalid starting cup' if start_pos < 0 || start_pos >=14
    raise 'Starting cup is empty' if cups[start_pos].length==0
    true
  end

  def make_move(start_pos, current_player_name)
      stones = cups[start_pos]
      # debugger if start_pos == 10 && current_player_name == "James"
      cups[start_pos] = []
      while stones.length > 0
        start_pos += 1
        start_pos %= 14
        left = current_player_name == name1 && start_pos == 13 # their cup
        right = current_player_name == name2 && start_pos == 6 # their cup
        cups[start_pos] << stones.shift() if !left && !right
      end
      self.render
      self.next_turn(start_pos)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    return :prompt if ending_cup_idx == 6 || ending_cup_idx == 13
    if cups[ending_cup_idx].length == 1
      return :switch
    end
    ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    cups[0..5].all?{|cup| cup.empty?} || cups[7..-2].all?{|cup| cup.empty?}
  end

  def winner
    return :draw if cups[6].length == cups[13].length
    return name1 if cups[6].length > cups[13].length
    return name2
  end
  private
  attr_reader :name1, :name2
end


if __FILE__ == $PROGRAM_NAME
  b = Board.new("J","Q")
  p b.cups
  # p b.cups[6].empty?
  # p b.cups[13].empty?
end