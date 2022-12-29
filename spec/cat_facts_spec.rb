require 'cat_facts'

RSpec.describe CatFacts do
    it "returns a cat fact" do
        fake_requester = double :requester
        expect(fake_requester).to receive(:get).with(URI("https://catfact.ninja/fact")).and_return('{"fact":"A female cat can be referred to as a molly or a queen, and a male cat is often labeled as a tom.","length":96}')
        cat_facts = CatFacts.new(fake_requester)
        expect(cat_facts.provide).to eq "Cat fact: A female cat can be referred to as a molly or a queen, and a male cat is often labeled as a tom."
    end
end