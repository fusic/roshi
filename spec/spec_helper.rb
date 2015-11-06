$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'roshi'

class TestModel
  include ActiveModel::Validations

  attr_accessor :email, :zip_code, :version_number

  def initialize(attrs = {})
    attrs.each_pair { |k,v| send("#{k}=", v) }
  end
end
