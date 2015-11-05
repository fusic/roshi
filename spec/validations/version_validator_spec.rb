require 'spec_helper'

class VersionNumberModel < TestModel
  validates :version_number, version_number: true
end

describe 'VersionNumberValidator' do
  context 'valid version numbers' do
    [
      '0.1',
      '0.10',
      '1.0',
      '1.0.1',
      '1.10.1',
    ].each do |version|
      it "#{version} should be valid" do
        expect(VersionNumberModel.new(version_number: version)).to be_valid
      end
    end
  end

  context 'invalid version numbers' do
    [
      '',
      '0..1',
      '1.0..1',
      'version_number',
      'あいうえお',
    ].each do |version|
      it "#{version} should be invalid" do
        expect(VersionNumberModel.new(version_number: version)).not_to be_valid
      end
    end
  end
end
