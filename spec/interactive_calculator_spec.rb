require 'interactive_calculator'

RSpec.describe InteractiveCalculator do
    it "subtracts two numbers and returns result" do
        io = double :io

        expect(io).to receive(:puts).with("Hello. I will subtract two numbers.").ordered
        expect(io).to receive(:puts).with("Please enter a number").ordered
        expect(io).to receive(:gets).and_return("4").ordered
        expect(io).to receive(:puts).with("Please enter another number").ordered
        expect(io).to receive(:gets).and_return("3").ordered
        expect(io).to receive(:puts).with("Here is your result:").ordered
        expect(io).to receive(:puts).with("4 - 3 = 1").ordered
        
        interactive_calculator = InteractiveCalculator.new(io)
        interactive_calculator.run
    end

    it "fails if given a string instead of the first number" do
        io = double :io

        expect(io).to receive(:puts).with("Hello. I will subtract two numbers.").ordered
        expect(io).to receive(:puts).with("Please enter a number").ordered
        expect(io).to receive(:gets).and_return("hello").ordered

        interactive_calculator = InteractiveCalculator.new(io)
        expect {interactive_calculator.run}.to raise_error "You must enter a number!"
    end

    it "fails if given a string instead of the second number" do
        io = double :io

        expect(io).to receive(:puts).with("Hello. I will subtract two numbers.").ordered
        expect(io).to receive(:puts).with("Please enter a number").ordered
        expect(io).to receive(:gets).and_return("4").ordered
        expect(io).to receive(:puts).with("Please enter another number").ordered
        expect(io).to receive(:gets).and_return("hello").ordered

        interactive_calculator = InteractiveCalculator.new(io)
        expect {interactive_calculator.run}.to raise_error "You must enter a number!"
    end
end