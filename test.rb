require 'rspec/autorun'
require_relative './sales_tax.rb'

def fake_stdin(text)
    begin
      $stdin = StringIO.new
      $stdin.puts(text)
      $stdin.rewind
      yield
    ensure
      $stdin = STDIN
    end
end

describe SalesTax do
    it "test fake input" do
        fake_stdin("foobar") do 
            input = gets.to_s.chomp.strip
            input.should == "foobar"
        end
    end

    it "test output1" do
        input1 = fake_stdin("1 book at 12.49")
        input2 = fake_stdin("1 music CD at 14.99")
        input3 = fake_stdin("1 chocolate bar at 0.85")
    end
end