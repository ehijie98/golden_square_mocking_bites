require 'time_error'

RSpec.describe TimeError do
    it "returns time difference between server time and computer time" do
        fake_requester = double :requester
        allow(fake_requester).to receive(:get).with(
            URI("https://worldtimeapi.org/api/ip")
        ).and_return('{"abbreviation":"GMT","client_ip":"79.73.46.88","datetime":"2022-12-29T17:37:57.805313+00:00","day_of_week":4,"day_of_year":363,"dst":false,"dst_from":null,"dst_offset":0,"dst_until":null,"raw_offset":0,"timezone":"Europe/London","unixtime":1672335477,"utc_datetime":"2022-12-29T17:37:57.805313+00:00","utc_offset":"+00:00","week_number":52}')
        time = Time.new(2022,12,29, 17, 37, 57)
        time_error = TimeError.new(fake_requester)
        expect(time_error.error(time)).to eq 0.805313
    end
end