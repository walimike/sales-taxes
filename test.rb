require 'rspec/autorun'
require_relative './sales_tax.rb'

describe SalesTax do
    it "add two numbers" do
        calc = SalesTax.new
        expect(calc.add(3, 4)).to eq(7)
    end
end