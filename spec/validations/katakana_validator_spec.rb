require 'spec_helper'

class KatakanaModel < TestModel
  validates :katakana, katakana: true
end

class KatakanaAllowSpaceModel < TestModel
  validates :katakana, katakana: {allow_space: true}
end

describe 'KatakanaValidator' do
  context 'valid katakana' do
    [
      '',
      'カタカナ',
      'カタカナー'
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
      'カタ カナー'
    ].each do |katakana|
      it "#{katakana} should be valid" do
        expect(KatakanaModel.new(katakana: katakana)).not_to be_valid
      end
    end
  end
  
  context 'valid katakana(allow_space)' do
    [
      ' ',
      ' カタ カナー ',
      'カタ　カナー'
    ].each do |katakana|
      it "#{katakana} should be valid" do
        expect(KatakanaAllowSpaceModel.new(katakana: katakana)).to be_valid
      end
    end
  end
end
