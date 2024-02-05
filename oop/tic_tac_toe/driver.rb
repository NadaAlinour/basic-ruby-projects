# frozen_string_literal: true
require_relative './board'
require_relative './player'

board = Board.new
player1 = Player.new # 'x'
player2 = Player.new # 'o'
board.add_player(player1)
board.add_player(player2)

board.show_board


# check and toggle turn here
# and while loop
game_end = false
while !game_end
  puts "Player #{board.turn}'s turn."
  row = gets.chomp
  col = gets.chomp
  if board.turn == 'X'
    player1.make_move(row.to_i, col.to_i)
    result = board.update_board(player1)

    while result == -1
      row = gets.chomp
      col = gets.chomp
      player1.make_move(row.to_i, col.to_i)
      result = board.update_board(player1)
    end

    if board.winner?(player1)
      puts "Player 1 (X) wins!"
      game_end = true
    end
  else
    player2.make_move(row.to_i, col.to_i)
    result = board.update_board(player2)

    while result == -1
      row = gets.chomp
      col = gets.chomp
      player2.make_move(row.to_i, col.to_i)
      result = board.update_board(player2)
    end

    if board.winner?(player2)
      puts "Player 2 (O) wins!"
      game_end = true
    end

  end

  if board.is_full?
    puts "It's a tie. Good game :)"
    break
  end

  board.turn == 'X' ? board.turn = 'O' : board.turn = 'X'
end
    


