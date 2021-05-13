require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:dessert) { Dessert.new("cake", 3 , chef ) }
  subject(:dessert2) { Dessert.new("brownie", "rat" , chef ) }

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.instance_variable_get(:@type)).to eq("cake")
    end
    it "sets a quantity" do
      expect(dessert.instance_variable_get(:@quantity)).to eq(3)
    end
    it "starts ingredients as an empty array" do
      expect(dessert.instance_variable_get(:@ingredients)).to eq([])
    end
    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("brownie", "rat" , chef) }.to raise_error
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do 
      ingredients = dessert.instance_variable_get(:@ingredients)
      dessert.add_ingredient("egg")
      expect(dessert.instance_variable_get(:@ingredients)).to eq(["egg"])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = dessert.instance_variable_get(:@ingredients)
      dessert.add_ingredient("egg")
      dessert.add_ingredient("flour")
      dessert.add_ingredient("milk")
      dessert.add_ingredient("squid")
      dessert.add_ingredient("squid1")
      dessert.add_ingredient("squid2")
      dessert.add_ingredient("squid3")
      dessert.mix!
      expect(dessert.instance_variable_get(:@ingredients)).to_not eq(["egg", "flour", "milk", "squid", "squid1", "squid2", "squid3"])
    end
  end

  describe "#eat" do
    before(:each) do
      dessert.eat(2)
    end
    it "subtracts an amount from the quantity" do
      expect(dessert.instance_variable_get(:@quantity)).to eq(1)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect {dessert.eat(4)}.to raise_error
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef chef the Great Baker")
      expect(dessert.serve.include?(chef.titleize)).to be true
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(dessert)
      dessert.make_more
    end
  end
end
