require 'rspec/autorun'
require_relative './sales_tax.rb'

input1 = [
    "1 book at 12.49",
    "1 music CD at 14.99",
    "1 chocolate bar at 0.85"
]

input2 = [
    "1 imported box of chocolates at 10.00",
    "1 imported bottle of perfume at 47.50"
]

input3 = [
    "1 imported bottle of perfume at 27.99",
    "1 bottle of perfume at 18.99",
    "1 packet of headache pills at 9.75",
    "1 box of imported chocolates at 11.25"
]

def create_new_sales_tax_instance items
    instance = SalesTax.new
    items.each do |commodity|
        instance.add_commodity commodity
    end
    instance
end


describe SalesTax do

    it "can process tax payment for input1" do
        instance = create_new_sales_tax_instance input1
        expect(instance.commodities.length()).to eq 3
        instance.process_payment
        expect(instance.get_sub_total).to eq "29.83"
        expect(instance.get_sales_tax).to eq "1.50"
    end

    it "can process tax payment for input2" do
        instance = create_new_sales_tax_instance input2
        expect(instance.commodities.length()).to eq 2
        instance.process_payment
        expect(instance.get_sub_total).to eq "65.15"
        expect(instance.get_sales_tax).to eq "7.65"
    end

    it "can process tax payment for input3" do
        instance = create_new_sales_tax_instance input3
        expect(instance.commodities.length()).to eq 4
        instance.process_payment
        expect(instance.get_sub_total).to eq "74.63"
        expect(instance.get_sales_tax).to eq "6.65"
    end
end
