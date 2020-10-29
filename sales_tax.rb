class SalesTax

    def initiate
        commodities = Array.new
        p 'Provide commodity and price and press Enter'
        commodity = gets.chomp
        self.add_item(commodity, commodities)    
    end

    def add_item(commodity, array)
        if commodity.empty?
            process_taxes array
        else
            array.append(commodity)
            p 'Provide another commodity or leave blank to checkout'
            commodity = gets.chomp
            self.add_item(commodity, array)
        end
    end

    def process_taxes(array)
        if array.empty?
            p 'No taxes'
        else
            p "You have #{array.length()}"
        end
    end

    def add(x,y)
        7
    end
end

instance = SalesTax.new
instance.initiate
