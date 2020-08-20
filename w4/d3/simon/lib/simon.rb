class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length, @game_over, @seq = 1, false, []
  end

  def play
    until self.game_over
      self.take_turn
    end
    self.game_over_message
    self.reset_game
  end

  def take_turn
    self.show_sequence
    if self.require_sequence
      self.round_success_message
      self.game_over = self.sequence_length == 2
      self.sequence_length += 1
    end
  end

  def show_sequence
    self.add_random_color
    seq.each do |item|
      p item
      sleep 1
    end
    system("clear")
  end

  def require_sequence
    i = 0
    seq.each do |el|
      begin
        str = gets.chomp
        raise 'not a color' unless COLORS.include?(str)
      rescue => exception
        p "#{exception.message}"
        retry
      end
      if str != el
        self.game_over = true
        return false
      end
    end
    true
  end

  def add_random_color
    self.seq << COLORS.sample
    # sequence_length = seq.length
  end

  def round_success_message
    p "You got it"
    sleep 2
    system("clear")
  end

  def game_over_message
    p "you suck"
    sleep 1
    system("clear")
  end

  def reset_game
    self.seq = []
    self.sequence_length = 1
    self.game_over = false
  end
end

if __FILE__ == $PROGRAM_NAME
  s = Simon.new
  s.play
end

