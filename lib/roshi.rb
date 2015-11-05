require 'active_model'
require 'roshi/version'
%w(email version_number).each do |validator_name|
  require "roshi/active_model/validations/#{validator_name}_validator"
end
