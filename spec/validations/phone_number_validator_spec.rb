require 'spec_helper'

class DefaultPhoneNumberModel < TestModel
  validates :phone_number, phone_number: true
end

class WithHiphenationPhoneNumberModel < TestModel
  validates :phone_number, phone_number: { hiphenation: true }
end

class WithOutHiphenationPhoneNumberModel < TestModel
  validates :phone_number, phone_number: { hiphenation: false }
end

describe 'PhoneNumberValidator' do
  describe 'DefaultPhoneNumberValidation' do
    context 'valid phone numbers' do
      [
        '0123-12-1234',
        '0123121234',
        '03-1234-1234',
        '0312341234',
        '090-1234-1234',
        '09012341234',
        '0120-123-456',
        '01234-1-2345',
        '0123412345'
      ].each do |phone_number|
        it "#{phone_number} should be valid" do
          expect(DefaultPhoneNumberModel.new(phone_number: phone_number)).to be_valid
        end
      end
    end

    context 'invalid phone numbers' do
      [
        '',
        '0123-1-1234',
        '0123-12-12345',
        '0-12-12345',
        '0123-12-1',
        'phonenumber',
        'あいうえお',
        '012-345-678',
        '012345678',
        '11234-1-2345',
        '1123412345'
      ].each do |phone_number|
        it "#{phone_number} should be invalid" do
          expect(DefaultPhoneNumberModel.new(phone_number: phone_number)).not_to be_valid
        end
      end
    end
  end

  describe 'WithHiphenationPhoneNumberValidation' do
    context 'valid phone numbers' do
      [
        '0123-12-1234',
        '03-1234-1234',
        '090-1234-1234',
        '0120-123-456',
        '01234-1-2345',
        '01234-12-345'
      ].each do |phone_number|
        it "#{phone_number} should be valid" do
          expect(WithHiphenationPhoneNumberModel.new(phone_number: phone_number)).to be_valid
        end
      end
    end

    context 'invalid phone numbers' do
      [
        '0123121234',
        '03121234',
        '09012341234',
        '012341-2345',
        '0123-412345',
        '1123-412345',
        '1123412345'
      ].each do |phone_number|
        it "#{phone_number} should be invalid" do
          expect(WithHiphenationPhoneNumberModel.new(phone_number: phone_number)).not_to be_valid
        end
      end
    end
  end

  describe 'WithOutHiphenationPhoneNumberValidation' do
    context 'valid phone numbers' do
      [
        '0123121234',
        '0312341234',
        '09012341234',
        '0123412345',
        '0123412345'
      ].each do |phone_number|
        it "#{phone_number} should be valid" do
          expect(WithOutHiphenationPhoneNumberModel.new(phone_number: phone_number)).to be_valid
        end
      end
    end

    context 'invalid phone numbers' do
      [
        '0123-12-1234',
        '03-12-1234',
        '090-1234-1234',
        '012345678',
        '1123412345'
      ].each do |phone_number|
        it "#{phone_number} should be invalid" do
          expect(WithOutHiphenationPhoneNumberModel.new(phone_number: phone_number)).not_to be_valid
        end
      end
    end
  end
end
