require 'spec_helper'

class KatakanaModel < TestModel
  validates :katakana, katakana: true
end

describe 'KatakanaValidator' do
  context 'valid katakana' do
    [
      '',
      'カタカナ',
      'カタカナー',
    ].each do |katakana|
      it "#{katakana} should be valid" do
        expect(KatakanaModel.new(katakana: katakana)).to be_valid
      end
    end
  end

  context 'invalid katakana' do
    [
      1,
      'alphabet',
      'ひらがな',
      '漢字',
      'ひらがなとカタカナ',
    ].each do |katakana|
      it "#{katakana} should be valid" do
        expect(KatakanaModel.new(katakana: katakana)).not_to be_valid
      end
    end
  end
end
