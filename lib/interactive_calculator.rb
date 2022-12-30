class InteractiveCalculator
    def initialize(io)
        @io = io
    end

    def run
        @io.puts "Hello. I will subtract two numbers."
        @io.puts "Please enter a number"
        number_one = get_number
        @io.puts "Please enter another number"
        number_two = get_number
        @io.puts "Here is your result:"
        @io.puts "#{number_one} - #{number_two} = #{number_one - number_two}"
    end

    private
    
    def get_number
        response = @io.gets
        return response.to_i if response.to_i.to_s == response
        fail "You must enter a number!"
    end
end

# interactive_calculator = InteractiveCalculator.new(Kernel)
# interactive_calculator.run


# Hello. I will subtract two numbers.
# Please enter a number
# 4
# Please enter another number
# 3
# Here is your result:
# 4 - 3 = 1
