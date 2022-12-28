require 'track'

RSpec.describe Track do
    it "constructs" do
        track_one = Track.new("one two three", "artist_one")
        track_one = Track.new("three four five", "artist_two")
    end

    it "matches when given a keyword in the title or artist" do
        track = Track.new("one MATCHES two", "artist_one")
        expect(track.matches?("MATCHES")).to eq true
    end

    it "does not match when given a keyword absent from title or artist" do
        track = Track.new("one MATCHES two", "artist_one")
        expect(track.matches?("NO")).to eq false
    end
end