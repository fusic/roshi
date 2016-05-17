$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'roshi'

class TestModel
  include ActiveModel::Validations

  attr_accessor :email, :zip_code, :phone_number,
                :date, :hiragana, :version_number,
                :large_value, :middle_value, :small_value

  def initialize(attrs = {})
    attrs.each_pair { |k,v| send("#{k}=", v) }
  end
end
