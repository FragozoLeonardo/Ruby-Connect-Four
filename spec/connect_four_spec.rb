# spec/connect_four_spec.rb

require_relative './connect_four'

RSpec.describe ConnectFour do
  describe "#new" do
    it "creates a new ConnectFour instance" do
      game = ConnectFour.new
      expect(game).to be_an_instance_of(ConnectFour)
    end
  end

  describe "#make_move" do
    context "when a valid move is made" do
      it "places the player's piece in the specified column" do
        game = ConnectFour.new
        game.make_move(1)
        expect(game.board[5][0]).to eq("\u25CF")
      end
    end

    context "when an invalid move is made" do
      it "returns false and does not change the board" do
        game = ConnectFour.new
        initial_board = game.board.dup
        result = game.make_move(8)
        expect(result).to be_falsey
        expect(game.board).to eq(initial_board)
      end
    end
  end

  describe "#check_win" do
    context "when there is a vertical win" do
      it "returns true" do
        game = ConnectFour.new
        4.times { game.make_move(1) }
        expect(game.check_win).to be_truthy
      end
    end

    context "when there is a horizontal win" do
      it "returns true" do
        game = ConnectFour.new
        (1..4).each { |col| game.make_move(col) }
        expect(game.check_win).to be_truthy
      end
    end

    context "when there is a diagonal win (positive slope)" do
      it "returns true" do
        game = ConnectFour.new
        (1..3).each { |col| 3.times { game.make_move(col) } }
        game.make_move(4)
        expect(game.check_win).to be_truthy
      end
    end

    context "when there is a diagonal win (negative slope)" do
      it "returns true" do
        game = ConnectFour.new
        game.make_move(4)
        (1..3).each { |col| 3.times { game.make_move(col) } }
        expect(game.check_win).to be_truthy
      end
    end

    context "when there is no win" do
      it "returns false" do
        game = ConnectFour.new
        3.times { game.make_move(1) }
        expect(game.check_win).to be_falsey
      end
    end
  end
end
