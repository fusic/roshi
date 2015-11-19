require 'spec_helper'

class DefaultZipCodeModel < TestModel
  validates :zip_code, zip_code: true
end

class WithHiphenationZipCodeModel < TestModel
  validates :zip_code, zip_code: { hiphenation: true }
end

class WithOutHiphenationZipCodeModel < TestModel
  validates :zip_code, zip_code: { hiphenation: false }
end

describe 'ZipCodeValidator' do
  describe 'DefaultZipCodeValidation' do
    context 'valid zip codes' do
      [
        '8100001',
        '810-0001'
      ].each do |zip_code|
        it "#{zip_code} should be valid" do
          expect(DefaultZipCodeModel.new(zip_code: zip_code)).to be_valid
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
          expect(DefaultZipCodeModel.new(zip_code: zip_code)).not_to be_valid
        end
      end
    end
  end

  describe 'WithHiphenationZipCodeValidation' do
    context 'valid zip codes' do
      [
        '810-0001'
      ].each do |zip_code|
        it "#{zip_code} should be valid" do
          expect(WithHiphenationZipCodeModel.new(zip_code: zip_code)).to be_valid
        end
      end
    end

    context 'invalid zip codes' do
      [
        '8100001'
      ].each do |zip_code|
        it "#{zip_code} should be invalid" do
          expect(WithHiphenationZipCodeModel.new(zip_code: zip_code)).not_to be_valid
        end
      end
    end
  end

  describe 'WithOutHiphenationZipCodeValidation' do
    context 'valid zip codes' do
      [
        '8100001'
      ].each do |zip_code|
        it "#{zip_code} should be valid" do
          expect(WithOutHiphenationZipCodeModel.new(zip_code: zip_code)).to be_valid
        end
      end
    end

    context 'invalid zip codes' do
      [
        '810-0001'
      ].each do |zip_code|
        it "#{zip_code} should be invalid" do
          expect(WithOutHiphenationZipCodeModel.new(zip_code: zip_code)).not_to be_valid
        end
      end
    end
  end
end
