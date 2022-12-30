require 'json'


class CatFacts
    def initialize(requester)
        @requester = requester
    end

    def provide
        return "Cat fact: #{get_cat_fact["fact"]}"
    end

    private

    def get_cat_fact
        text_response = @requester.get(URI("https://catfact.ninja/fact"))
        return JSON.parse(text_response)
    end
end

require 'net/https'

# cat_facts = CatFacts.new(Net::HTTP)
# p cat_facts.provide