require "rspec"

describe Gotham::Cards do
  let!(:cards) { Gotham::Cards.new }
  describe "#new" do
    it "initialize" do
      cards.deck.should be_empty
      cards.discard.should be_empty
      cards.master.should be_empty
    end
  end
end
