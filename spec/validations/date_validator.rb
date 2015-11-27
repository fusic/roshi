require 'spec_helper'

class DateModel < TestModel
  validates :date, date: true
end

describe 'DateValidator' do
  context 'valid dates' do
    [
      '2015-10-01',
      '2015/10/01',
      '20151001',
      '2015-10-1',
      '2015/10/1',
      '2015101'
    ].each do |date|
      it "#{date} should be valid" do
        expect(DateModel.new(date: date)).to be_valid
      end
    end
  end

  context 'invalid dates' do
    [
      '',
      '2015-02-31',
      '2015-13-01',
      '2015-01-00',
      'date',
      'あいうえお'
    ].each do |date|
      it "#{date} should be invalid" do
        expect(DateModel.new(date: date)).not_to be_valid
      end
    end
  end
end
