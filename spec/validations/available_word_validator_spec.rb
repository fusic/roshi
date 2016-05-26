require "spec_helper"

class AcceptWordModel < TestModel
  validates :accept_word, available_word: { accept_words: %w(accept available) }
end

class RejectWordModel < TestModel
  validates :reject_word, \
            available_word: { reject_words: %w(reject unavailable) }
end

describe "AvailableWordValidator" do
  context "accept word accept_words include" do
    %w(accept available).each do |word|
      it "#{word} should be valid" do
        expect(AcceptWordModel.new(accept_word: word)).to be_valid
      end
    end
  end

  context "reject word except for accept_words" do
    %w(reject unavailable).each do |word|
      it "#{word} should be invalid" do
        expect(AcceptWordModel.new(accept_word: word)).not_to be_valid
      end
    end
  end

  context "reject word reject_words include" do
    %w(reject unavailable).each do |word|
      it "#{word} should be invalid" do
        expect(RejectWordModel.new(reject_word: word)).not_to be_valid
      end
    end
  end

  context "accept word except for reject words" do
    %w(accept available).each do |word|
      it "#{word} should be valid" do
        expect(RejectWordModel.new(reject_word: word)).to be_valid
      end
    end
  end
end
