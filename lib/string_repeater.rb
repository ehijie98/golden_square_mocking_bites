class StringRepeater
    def initialize(io)
        @io = io
    end

    def run
        @io.puts "Hello. I will repeat a string many times."
        @io.puts "Please enter a string"
        string = @io.gets.chomp
        @io.puts "Please enter a number of repeats"
        multiplier = get_multiplier
        @io.puts "Here is your result:"
        @io.puts "#{string * multiplier}" 
    end

    private

    def get_multiplier
        input = @io.gets 
        raise "Please ensure multiplier is an integer!" unless input.to_i.to_s == input
        return input.to_i
    end
end



# string_repeater = StringRepeater.new(Kernel)
# string_repeater.run

# Hello. I will repeat a string many times.
# Please enter a string
# TWIX
# Please enter a number of repeats
# 10
# Here is your result:
# TWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIX