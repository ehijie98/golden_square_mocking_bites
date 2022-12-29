require 'secret_diary'

RSpec.describe SecretDiary do
    context "when initially locked" do
        it "returns error for locked diary when read is called" do
            diary = double :diary
            secret_diary = SecretDiary.new(diary)
                expect{secret_diary.read}.to raise_error "Go away!"
        end
    end
    context "when unlocked" do
        it "returns diary's contents for unlocked diary when read method is called" do
            diary = double :diary, read: "fake contents"
            secret_diary = SecretDiary.new(diary)
            secret_diary.unlock
                expect(secret_diary.read).to eq "fake contents"
        end
    end

    context "when relocked" do
        it "returns error when read method is called" do
            diary = double :diary
            secret_diary = SecretDiary.new(diary)
            secret_diary.unlock
            secret_diary.lock
                expect{secret_diary.read}.to raise_error "Go away!"
        end
    end
end