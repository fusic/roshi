require 'active_model'
require 'roshi/version'
%w(
  email zip_code phone_number date hiragana
  version_number available_word numerical_comparison
).each do |validator_name|
  require "roshi/active_model/validations/#{validator_name}_validator"
end
