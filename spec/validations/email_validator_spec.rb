require 'spec_helper'

class EmailModel < TestModel
  validates :email, email: true
end

describe 'EmailValidator' do
  context 'valid emails' do
    [
      'email@example.com',
      'firstname.lastname@example.com',
      'email@subdomain.example.com',
      'firstname+lastname@example.com',
      'email@example.name',
      'email@example.museum',
      'email@example.co.jp',
      'email@hoge.example-foo.com',
      "email+!#$%&'*+-/=?^_`.{|}~@example.com"
    ].each do |email|
      it "#{email} should be valid" do
        expect(EmailModel.new(email: email)).to be_valid
      end
    end
  end

  context 'invalid emails' do
    [
      '',
      'email',
      '@example.com',
      'email@',
      'email.example.com',
      'email@example..com',
      'あいうえお@example.com'
    ].each do |email|
      it "#{email} should be invalid" do
        expect(EmailModel.new(email: email)).not_to be_valid
      end
    end
  end
end
