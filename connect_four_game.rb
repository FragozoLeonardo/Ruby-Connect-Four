require_relative 'connect_four'

class ConnectFourGame
  attr_accessor :game

  def initialize
    @game = ConnectFour.new
  end

  def play
    result = true
    while result == true
      print_board
      result = make_move
    end
    print_winner if result == 'win'
  end

  def check_win
    switch_player
    win = check_vertical_win || check_horizontal_win || check_diagonal_win
    switch_player
    win
  end

  private

  def print_board
    game.board.each do |row|
      puts row.map { |cell| cell || ' ' }.join(' | ')
      puts '-' * 29
    end
    puts '1   2   3   4   5   6   7'
  end

  def make_move
    print 'Enter the column number (1-7): '
    column = gets.chomp.to_i
    game.make_move(column)
  end

  def valid_move?(column)
    (1..7).include?(column) && game.board[0][column - 1].nil?
  end

  def find_empty_row(column)
    5.downto(0) do |row|
      return row if game.board[row][column].nil?
    end
  end

  def switch_player
    game.current_player = game.current_player == ConnectFour::PLAYER_1 ? ConnectFour::PLAYER_2 : ConnectFour::PLAYER_1
  end

  def print_winner
    switch_player
    print_board
    puts "Player #{game.current_player} wins!"
  end
end

ConnectFourGame.new.play
