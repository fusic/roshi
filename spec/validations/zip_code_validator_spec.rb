require 'spec_helper'

class ZipCodeModel < TestModel
  validates :zip_code, zip_code: true
end

describe 'ZipCodeValidator' do
  context 'valid zip codes' do
    [
      '8100001',
      '810-0001'
    ].each do |zip_code|
      it "#{zip_code} should be valid" do
        expect(ZipCodeModel.new(zip_code: zip_code)).to be_valid
      end
    end
  end

  context 'invalid zip codes' do
    [
      '',
      '00000000',
      '000-00000',
      '0000-000',
      'zipcode',
      'あいうえお',
    ].each do |zip_code|
      it "#{zip_code} should be invalid" do
        expect(ZipCodeModel.new(zip_code: zip_code)).not_to be_valid
      end
    end
  end
end
