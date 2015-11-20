require 'active_model'
require 'roshi/version'
%w(email zip_code phone_number hiragana version_number).each do |validator_name|
  require "roshi/active_model/validations/#{validator_name}_validator"
end
