class SalesTax
    @@sales_tax = 0
    @@commodities = Array.new

    def initiate
        p 'Provide commodity and price and press Enter'
        commodity = gets.chomp
        self.add_item(commodity)    
    end

    def add_item(commodity)
        if commodity.empty?
            process_taxes @@commodities
        else
            @@commodities << commodity
            p 'Provide another commodity or leave blank to checkout'
            commodity = gets.chomp
            self.add_item(commodity)
        end
    end

    def process_taxes(array)
        if array.empty?
            p 'No taxes'
        else
            array.each do |item|
                self.fuzzy_look_up(item)
            end
            p @@sales_tax
        end
    end

    def fuzzy_look_up(item)
        if item.include? 'chocolate' or item.include? 'headache' or item.include? 'book'
            res = item.split('at')
            @@sales_tax += res[1].to_i * 0.05
        else
            res = item.split('at')
            @@sales_tax += res[1].to_i * 0.1
        end
    end
end


instance = SalesTax.new
instance.initiate
