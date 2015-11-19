require 'spec_helper'

class HiraganaModel < TestModel
  validates :hiragana, hiragana: true
end

describe 'HiraganaValidator' do
  context 'valid hiragana' do
    [
      '',
      'ひらがな',
      'ひらがなー',
    ].each do |hiragana|
      it "#{hiragana} should be valid" do
        expect(HiraganaModel.new(hiragana: hiragana)).to be_valid
      end
    end
  end

  context 'invalid hiragana' do
    [
      1,
      'alphabet',
      'カタカナ',
      '漢字',
      'ひらがなとカタカナ',
    ].each do |hiragana|
      it "#{hiragana} should be valid" do
        expect(HiraganaModel.new(hiragana: hiragana)).not_to be_valid
      end
    end
  end
end
