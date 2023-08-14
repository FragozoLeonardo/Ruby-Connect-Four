# spec/connect_four_spec.rb

require_relative '../connect_four'

RSpec.describe ConnectFour do
  describe "#new" do
    it "creates a new ConnectFour instance" do
      game = ConnectFour.new
      expect(game).to be_an_instance_of(ConnectFour)
    end
  end

  # Add more example blocks here as you develop your game
end
cdc
