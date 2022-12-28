require 'music_library'
require 'track'

RSpec.describe 'integration' do
    it 'adds and returns a list of track objects' do
        library = MusicLibrary.new
        track_one = Track.new("one two three", "artist_one")
        track_two = Track.new("three four five", "artist_two")
        library.add(track_one)
        library.add(track_two)
        result = library.all 
            expect(result).to eq [track_one, track_two]
    end

    context 'keyword is present in all track objects' do
        it 'search method returns all track objects in list' do
            library = MusicLibrary.new
            track_one = Track.new("one two three", "artist_one")
            track_two = Track.new("three four five", "artist_two")
            library.add(track_one)
            library.add(track_two)
            result = library.search("two")
                expect(result).to eq [track_one, track_two]
        end
    end

    context 'keyword is only present in one track object' do
        it 'search method returns one track object in list' do
            library = MusicLibrary.new
            track_one = Track.new("one two three", "artist_one")
            track_two = Track.new("three four five", "artist_two")
            library.add(track_one)
            library.add(track_two)
            result = library.search("four")
                expect(result).to eq [track_two]
        end
    end

    context 'keyword is not present in any track object' do
        it 'returns empty list' do
            library = MusicLibrary.new
            track_one = Track.new("one two three", "artist_one")
            track_two = Track.new("three four five", "artist_two")
            library.add(track_one)
            library.add(track_two)
            result = library.search("six")
                expect(result).to eq []
        end
    end
end