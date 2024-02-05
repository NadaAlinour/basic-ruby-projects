class Board
  attr_accessor :state, :number_of_players, :turn 

  def initialize
    @state = Array.new(3) {Array.new(3, 1)}
    @players = []
    @turn = 'X'
  end

  def show_board
    puts "#{@state[0][0]} #{@state[0][1]} #{@state[0][2]}"
    puts "#{@state[1][0]} #{@state[1][1]} #{@state[1][2]}"
    puts "#{@state[2][0]} #{@state[2][1]} #{@state[2][2]}"
  end

  private
  def can_start_game?
    @players.length == 2
  end

  public
  # ensure that each board has exactly two players
  def add_player(player)
    if !can_start_game?
      @players.push(player)
      if @players.length < 2
        player.marker = 'X'
      else
        player.marker = 'O'
      end
    else
      puts "Number of players is #{@players.length}. Game starts when two players have joined."
    end
  end

  public

  def winner?(player)

    # check rows
    @state.each do |row|
      return true if row.all? {|element| element == player.marker}
    end

    # check columns
    for i in 0..2
      return true if (@state[0][i] == player.marker && @state[1][i] == player.marker && @state[2][i] == player.marker)
    end
   
    # check forward diagonal
    return true if (@state[2][0] == player.marker && @state[1][1] == player.marker && @state[0][2] == player.marker)

    # check backward diagonal
    return true if (@state[0][0] == player.marker && @state[1][1] == player.marker && @state[2][2] == player.marker)

    return false
  end

  private
  def valid_move?(coordinate_a, coordinate_b)
    # return true if cell is neither 'X' nor 'O'
    return true if @state[coordinate_a][coordinate_b] != 'X' && @state[coordinate_a][coordinate_b] != 'O'
  end

  # call winner? after each move and keep track of whose turn it is
  # check if game can start etc

  public
  def is_full?
    @state.each do |row|
      return false if row.include?(1)
    end
    true
  end

  public 

  def update_board(player)
    if self.valid_move?(player.latest_move[0], player.latest_move[1])
      @state[player.latest_move[0]][player.latest_move[1]] = player.marker
      self.show_board
    else
      puts 'Invalid move. please try a different one.' # turn into a while loop or sum
      return -1
    end
    # puts self.winner?(player)
  end

  

  
end