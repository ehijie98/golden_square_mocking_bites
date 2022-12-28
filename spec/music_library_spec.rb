
RSpec.describe MusicLibrary do
    it "constructs" do
        library = MusicLibrary.new
    end

    it 'adds and returns a list of track objects' do
        library = MusicLibrary.new
        track_one = double :track
        track_two = double :track
        library.add(track_one)
        library.add(track_two)
        result = library.all 
            expect(result).to eq [track_one, track_two]
    end

    context 'keyword is only present in one track object' do
        it 'search method returns one track object in list' do
            library = MusicLibrary.new
            track_one = double :track
            expect(track_one).to receive(:matches?).with("four").and_return(true)
            track_two = double :track
            expect(track_two).to receive(:matches?).with("four").and_return(false)
            library.add(track_one)
            library.add(track_two)
            result = library.search("four")
                expect(result).to eq [track_one]
        end
    end

    
end