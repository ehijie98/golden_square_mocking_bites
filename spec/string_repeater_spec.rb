require 'string_repeater.rb'

RSpec.describe StringRepeater do
    it "repeats a string a specific number of times" do
        io = double :io

        expect(io).to receive(:puts).with("Hello. I will repeat a string many times.").ordered
        expect(io).to receive(:puts).with("Please enter a string").ordered
        expect(io).to receive(:gets).and_return("TWIX").ordered
        expect(io).to receive(:puts).with("Please enter a number of repeats").ordered
        expect(io).to receive(:gets).and_return("4").ordered
        expect(io).to receive(:puts).with("Here is your result:").ordered
        expect(io).to receive(:puts).with("TWIXTWIXTWIXTWIX").ordered


        string_repeater = StringRepeater.new(io)
        string_repeater.run
    end

    it "fails when multiplier is not an integer" do
        io = double :io

        expect(io).to receive(:puts).with("Hello. I will repeat a string many times.").ordered
        expect(io).to receive(:puts).with("Please enter a string").ordered
        expect(io).to receive(:gets).and_return("TWIX").ordered
        expect(io).to receive(:puts).with("Please enter a number of repeats").ordered
        expect(io).to receive(:gets).and_return("Hello").ordered

        string_repeater = StringRepeater.new(io)
        expect{string_repeater.run}.to raise_error "Please ensure multiplier is an integer!"
    end
end