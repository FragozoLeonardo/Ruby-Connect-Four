# frozen_string_literal: true

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
    @game.make_move(column)
  end

  def print_winner
    game.switch_player
    print_board
    puts "Player #{game.current_player} wins!"
  end
end

ConnectFourGame.new.play
