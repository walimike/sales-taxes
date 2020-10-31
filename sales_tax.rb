class SalesTax
    @@sales_tax = 0
    @@sub_total = 0
    @@commodities = Array.new

    def initiate
        p 'Provide commodity and price and press Enter'
        commodity = gets.chomp
        self.add_item commodity 
    end

    def add_item(commodity)
        if commodity.empty?
            self.process_payment 
        else
            @@commodities << commodity.split(' at ')
            p 'Provide another commodity or leave blank to checkout'
            commodity = gets.chomp
            self.add_item commodity
        end
    end

    def process_payment
        unless @@commodities.empty?
            @@commodities.each do |item|
                self.process_taxes item
            end
        end
        self.calculate_total_amount
        self.print_receipt
    end

    def process_taxes(item)
        item[1] = item[1].to_f
        if item[0].include? 'imported'
            if self.is_essential item[0]
                item_tax = self.calculate_tax item , 0.05
                self.calculate_tax_total item, item_tax
            else
                item_tax = self.calculate_tax(item , 0.1) + self.calculate_tax(item , 0.05)
                self.calculate_tax_total item, item_tax
            end
        else
            unless self.is_essential item[0]
                item_tax = self.calculate_tax item , 0.1
                self.calculate_tax_total item, item_tax
            end
        end
    end

    def is_essential(item)
        item.include? 'chocolate' or item.include? 'headache' or item.include? 'book'
    end

    def calculate_tax_total(item, item_tax )
        item[1] += item_tax
        @@sales_tax += item_tax
    end

    def calculate_tax(item, rate)
        tax = item[1] * rate
        (tax*20).round / 20.0
    end

    def calculate_total_amount
        @@commodities.each do |item|
            @@sub_total += item[1]
        end
    end

    def print_receipt
        @@commodities.each do |commodity|
            p " #{commodity[0]} : #{commodity[1].round(2)} "
        end
        p "Sales Taxes: #{@@sales_tax.round(2)}"
        p "Total: #{@@sub_total}"
    end
end
