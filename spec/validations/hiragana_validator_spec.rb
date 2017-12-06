require 'spec_helper'

class HiraganaModel < TestModel
  validates :hiragana, hiragana: true
end

class HiraganaAllowSpaceModel < TestModel
  validates :hiragana, hiragana: { allow_space: true }
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
      'ひら がなー',
    ].each do |hiragana|
      it "#{hiragana} should be valid" do
        expect(HiraganaModel.new(hiragana: hiragana)).not_to be_valid
      end
    end
  end
  
  context 'valid hiragana' do
    [
      ' ',
      ' ひら がな ',
      'ひら　がなー',
    ].each do |hiragana|
      it "#{hiragana} should be valid" do
        expect(HiraganaAllowSpaceModel.new(hiragana: hiragana)).to be_valid
      end
    end
  end
end
