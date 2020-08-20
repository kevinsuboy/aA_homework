require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }

  describe "#initialize" do
    it "sets a type" do
      expect( Dessert.new(:X,1,chef).type  ).to eq(:X)
      expect( Dessert.new(:Y,13,chef).type ).to eq(:Y)
      expect( Dessert.new(:Z,24,chef).type ).to eq(:Z)
    end

    it "sets a quantity" do
      expect( Dessert.new(:X,1,chef).quantity  ).to eq(1)
      expect( Dessert.new(:Y,13,chef).quantity ).to eq(13)
      expect( Dessert.new(:Z,24,chef).quantity ).to eq(24)
    end

    it "starts ingredients as an empty array" do
      expect( Dessert.new(:X,1,chef).ingredients  ).to be_empty
      expect( Dessert.new(:Y,13,chef).ingredients ).to be_empty
      expect( Dessert.new(:Z,24,chef).ingredients ).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect{ Dessert.new(:X,"1 ",chef).ingredients }.to raise_error(ArgumentError)
      expect{ Dessert.new(:Y,"13",chef).ingredients }.to raise_error(ArgumentError)
      expect{ Dessert.new(:Z,"24",chef).ingredients }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    let(:dessert) {Dessert.new(:X,1,chef)}
    it "adds an ingredient to the ingredients array" do
      expect(dessert.add_ingredient(:cheese)).to eq([:cheese])
      expect(dessert.add_ingredient(:poop  )).to eq([:cheese, :poop])
      expect(dessert.add_ingredient(:peep  )).to eq([:cheese, :poop, :peep])
    end
  end

  describe "#mix!" do
    let(:dessert) {Dessert.new(:X,1,chef)}
    before(:each) do
      dessert.add_ingredient(:cheese)
      dessert.add_ingredient(:poop  )
      dessert.add_ingredient(:peep  )
    end
    # ingredients = [:cheese, :poop, :peep]
    it "shuffles the ingredient array" do
      expect(dessert.mix!).to_not eq([:cheese, :poop, :peep])
    end
  end

  describe "#eat" do
    let(:dessert) {Dessert.new(:X,1,chef)}
    before(:each) do
      dessert.add_ingredient(:cheese)
      dessert.add_ingredient(:poop  )
      dessert.add_ingredient(:peep  )
    end
    it "subtracts an amount from the quantity" do
      expect(dessert.eat(1)).to eq(0)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect{dessert.eat(2)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    let(:dessert) {Dessert.new("brownies",1,chef)}
    before(:each) do
      dessert.add_ingredient(:cheese)
      dessert.add_ingredient(:poop  )
      dessert.add_ingredient(:peep  )
    end
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef John")
      expect(dessert.serve).to eq("Chef John has made 1 brownies!")
    end
  end

  describe "#make_more" do
    let(:dessert) {Dessert.new("brownies",1,chef)}
    it "calls bake on the dessert's chef with the dessert passed in" do
      allow(chef).to receive(:bake).and_return("bake brownie")
      expect{dessert.make_more}.to_not raise_error
    end
  end
end
