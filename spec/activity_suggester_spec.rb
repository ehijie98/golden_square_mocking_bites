require 'activity_suggester'

RSpec.describe ActivitySuggester do
    it "suggests an activity" do
        fake_requester = double :requester
        expect(fake_requester).to receive(:get).with(
            "www.boredapi.com", "/api/activity"
        ).and_return('{"activity":"Go to a nail salon","type":"relaxation","participants":1,"price":0.4,"link":"","key":"7526324","accessibility":0.5}')
        activity_suggester = ActivitySuggester.new(fake_requester)
        expect(activity_suggester.suggest).to eq "Why not: Go to a nail salon"
    end
end