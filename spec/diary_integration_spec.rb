require 'diary'
require 'secret_diary'

RSpec.describe "integration" do
    context "when initially locked" do
        it "returns error when read method is called" do
            diary = Diary.new("my contents")
            secret_diary = SecretDiary.new(diary)
                expect{secret_diary.read}.to raise_error "Go away!"
        end
    end

    context "when unlocked" do
        it "returns diary's contents when read method is called" do
            diary = Diary.new("my contents")
            secret_diary = SecretDiary.new(diary)
            secret_diary.unlock
                expect(secret_diary.read).to eq "my contents"
        end
    end

    context "when relocked" do
        it "returns error when read method is called" do
            diary = Diary.new("my contents")
            secret_diary = SecretDiary.new(diary)
            secret_diary.unlock
            secret_diary.lock
                expect{secret_diary.read}.to raise_error "Go away!"
        end
    end
end