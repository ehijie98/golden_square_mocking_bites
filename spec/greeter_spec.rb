require 'greeter'

RSpec.describe Greeter do
    it "asks the user their name and says hello" do
        io = double :io
        expect(io).to receive(:puts).with("What is your name?")
        expect(io).to receive(:gets).and_return("Ehijie")
        expect(io).to receive(:puts).with("Hello, Ehijie!")
        greeter = Greeter.new(io)
        greeter.greet
    end
end