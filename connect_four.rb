# frozen_string_literal: true

class ConnectFour
  PLAYER_1 = "\u25CF".encode('utf-8')
  PLAYER_2 = "\u25CB".encode('utf-8')

  attr_reader :board
  attr_accessor :current_player

  def initialize
    @board = Array.new(6) { Array.new(7, nil) }
    @current_player = PLAYER_1
  end

  def make_move(column)
    return false unless valid_move?(column)

    row = find_empty_row(column - 1)
    @board[row][column - 1] = @current_player
    win = check_win
    switch_player
    win ? 'win' : true
  end

  def check_win
    switch_player
    win = check_vertical_win || check_horizontal_win || check_diagonal_win
    switch_player
    win
  end

  private

  def valid_move?(column)
    (1..7).include?(column) && @board[0][column - 1].nil?
  end

  def find_empty_row(column)
    5.downto(0) do |row|
      return row if @board[row][column].nil?
    end
  end

  def switch_player
    @current_player = @current_player == PLAYER_1 ? PLAYER_2 : PLAYER_1
  end

  def check_vertical_win
    3.times do |row|
      7.times do |col|
        return true if @board[row][col] == @current_player &&
                       @board[row + 1][col] == @current_player &&
                       @board[row + 2][col] == @current_player &&
                       @board[row + 3][col] == @current_player
      end
    end
    false
  end

  def check_horizontal_win
    6.times do |row|
      4.times do |col|
        return true if @board[row][col] == @current_player &&
                       @board[row][col + 1] == @current_player &&
                       @board[row][col + 2] == @current_player &&
                       @board[row][col + 3] == @current_player
      end
    end
    false
  end

  def check_diagonal_win
    3.times do |row|
      4.times do |col|
        return true if @board[row][col] == @current_player &&
                       @board[row + 1][col + 1] == @current_player &&
                       @board[row + 2][col + 2] == @current_player &&
                       @board[row + 3][col + 3] == @current_player
      end
    end

    (3..5).each do |row|
      4.times do |col|
        return true if @board[row][col] == @current_player &&
                       @board[row - 1][col + 1] == @current_player &&
                       @board[row - 2][col + 2] == @current_player &&
                       @board[row - 3][col + 3] == @current_player
      end
    end

    false
  end
end
