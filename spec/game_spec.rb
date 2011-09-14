require "spec_helper"

describe Gotham::Game do
  let!(:game) { full_game }

  describe "#new" do
    it "should initialize" do

      game.map.should be_a_kind_of(Gotham::Map)
      game.players.should be_a_kind_of(Gotham::PlayerList)
      game.cards.should be_a_kind_of(Gotham::Cards)

      game.map.should have(3).regions
    end
  end

  describe "#mk_gotham_dangerous" do

    it "should add streets and disaster points to random block" do
      block_a = game.map.region("Heights").block(5)
      block_b = game.map.region("Heights").block(3)
      block_c = game.map.region("Heights").block(7)
      block_d = game.map.region("Heights").block(9)
      game.map.stub!(:random_block).and_return(block_a, block_b,
                                               block_c, block_d)

      game.mk_gotham_dangerous

      block_a.streets.should == 2
      block_b.streets.should == 2
      block_c.streets.should == 2
    end

  end

  describe "#" do
    it "should " do
      game.setup_game
      p = game.players.players.first
      puts game.players.players.first.show_area
    end

  end


end
