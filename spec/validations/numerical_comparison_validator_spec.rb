require "spec_helper"

class GreaterThanModel < TestModel
  validates :large_value, \
            numerical_comparison: {
              greater_than: :small_value
            }
end

class GreaterThanOrEqualToModel < TestModel
  validates :large_value, \
            numerical_comparison: {
              greater_than_or_equal_to: :small_value
            }
end

class EqualToModel < TestModel
  validates :large_value, \
            numerical_comparison: {
              equal_to: :small_value
            }
end

class LessThanOrEqualToModel < TestModel
  validates :small_value, \
            numerical_comparison: {
              less_than_or_equal_to: :large_value
            }
end

class LessThanModel < TestModel
  validates :small_value, \
            numerical_comparison: {
              less_than: :large_value
            }
end

class BetweenModel < TestModel
  validates :middle_value, \
            numerical_comparison: {
              between: { min: :small_value, max: :large_value }
            }
end

describe "VersionNumberValidator" do
  context "valid greater_than" do
    [
      { large_value: 10, small_value: 1 },
      { large_value: -5, small_value: -10 },
      { large_value: -3.4, small_value: -12 },
      { large_value: -3, small_value: -5.5 },
      { large_value: -4.4, small_value: -6.5 },
      { large_value: 123, small_value: -133 }
    ].each do |values|
      large_value = values[:large_value]
      small_value = values[:small_value]
      it "#{large_value} > #{small_value} should be valid" do
        expect(GreaterThanModel.new(values)).to be_valid
      end
    end
  end

  context "invalid greater_than" do
    [
      { small_value: 10, large_value: 1 },
      { small_value: -5, large_value: -10 },
      { small_value: -3.4, large_value: -12 },
      { small_value: -3, large_value: -5.5 },
      { small_value: -4.4, large_value: -6.5 },
      { small_value: 123, large_value: -133 },
      { large_value: nil, small_value: -133 },
      { large_value: 123, small_value: nil },
      { large_value: nil, small_value: nil },
      { small_value: 123, large_value: "あいうえお" },
      { small_value: "あいうえお", large_value: -133 },
      { small_value: "あいうえお", large_value: "あいうえお" }
    ].each do |values|
      large_value = values[:large_value]
      small_value = values[:small_value]
      it "#{large_value} > #{small_value} should be invalid" do
        expect(GreaterThanModel.new(values)).not_to be_valid
      end
    end
  end

  context "valid greater_than_or_equal_to" do
    [
      { large_value: 10, small_value: 1 },
      { large_value: -5, small_value: -10 },
      { large_value: -3.4, small_value: -12 },
      { large_value: -3, small_value: -5.5 },
      { large_value: -4.4, small_value: -6.5 },
      { large_value: 123, small_value: -133 },
      { large_value: 13, small_value: 13 }
    ].each do |values|
      large_value = values[:large_value]
      small_value = values[:small_value]
      it "#{large_value} >= #{small_value} should be valid" do
        expect(GreaterThanOrEqualToModel.new(values)).to be_valid
      end
    end
  end

  context "invalid greater_than_or_equal_to" do
    [
      { small_value: 10, large_value: 1 },
      { small_value: -5, large_value: -10 },
      { small_value: -3.4, large_value: -12 },
      { small_value: -3, large_value: -5.5 },
      { small_value: -4.4, large_value: -6.5 },
      { small_value: 123, large_value: -133 },
      { small_value: 13.2, large_value: 13 },
      { large_value: nil, small_value: -133 },
      { large_value: 123, small_value: nil },
      { large_value: nil, small_value: nil },
      { small_value: 123, large_value: "あいうえお" },
      { small_value: "あいうえお", large_value: -133 },
      { small_value: "あいうえお", large_value: "あいうえお" }
    ].each do |values|
      large_value = values[:large_value]
      small_value = values[:small_value]
      it "#{large_value} >= #{small_value} should be invalid" do
        expect(GreaterThanOrEqualToModel.new(values)).not_to be_valid
      end
    end
  end

  context "valid equal_to" do
    [
      { large_value: 10, small_value: 10 },
      { large_value: -5, small_value: -5 },
      { large_value: -3.4, small_value: -3.4 },
      { large_value: 10.2, small_value: 10.2 }
    ].each do |values|
      large_value = values[:large_value]
      small_value = values[:small_value]
      it "#{small_value} <= #{large_value} should be valid" do
        expect(GreaterThanOrEqualToModel.new(values)).to be_valid
      end
    end
  end

  context "invalid equal_to" do
    [
      { small_value: 10, large_value: 1 },
      { small_value: -5, large_value: -10 },
      { small_value: -3.4, large_value: -12 },
      { small_value: -3, large_value: -5.5 },
      { small_value: -4.4, large_value: -6.5 },
      { small_value: 123, large_value: -133 },
      { small_value: 13.2, large_value: 13 },
      { large_value: nil, small_value: -133 },
      { large_value: 123, small_value: nil },
      { large_value: nil, small_value: nil },
      { small_value: 123, large_value: "あいうえお" },
      { small_value: "あいうえお", large_value: -133 },
      { small_value: "あいうえお", large_value: "あいうえお" }
    ].each do |values|
      large_value = values[:large_value]
      small_value = values[:small_value]
      it "#{small_value} <= #{large_value} should be invalid" do
        expect(GreaterThanOrEqualToModel.new(values)).not_to be_valid
      end
    end
  end

  context "valid less_than" do
    [
      { large_value: 10, small_value: 1 },
      { large_value: -5, small_value: -10 },
      { large_value: -3.4, small_value: -12 },
      { large_value: -3, small_value: -5.5 },
      { large_value: -4.4, small_value: -6.5 },
      { large_value: 123, small_value: -133 }
    ].each do |values|
      large_value = values[:large_value]
      small_value = values[:small_value]
      it "#{small_value} < #{large_value} should be valid" do
        expect(LessThanModel.new(values)).to be_valid
      end
    end
  end

  context "invalid less_than" do
    [
      { small_value: 10, large_value: 1 },
      { small_value: -5, large_value: -10 },
      { small_value: -3.4, large_value: -12 },
      { small_value: -3, large_value: -5.5 },
      { small_value: -4.4, large_value: -6.5 },
      { small_value: 123, large_value: -133 },
      { large_value: nil, small_value: -133 },
      { large_value: 123, small_value: nil },
      { large_value: nil, small_value: nil },
      { small_value: 123, large_value: "あいうえお" },
      { small_value: "あいうえお", large_value: -133 },
      { small_value: "あいうえお", large_value: "あいうえお" }
    ].each do |values|
      large_value = values[:large_value]
      small_value = values[:small_value]
      it "#{small_value} < #{large_value} should be invalid" do
        expect(LessThanModel.new(values)).not_to be_valid
      end
    end
  end

  context "valid less_than_or_equal_to" do
    [
      { large_value: 10, small_value: 1 },
      { large_value: -5, small_value: -10 },
      { large_value: -3.4, small_value: -12 },
      { large_value: -3, small_value: -5.5 },
      { large_value: -4.4, small_value: -6.5 },
      { large_value: 123, small_value: -133 },
      { large_value: 13, small_value: 13 }
    ].each do |values|
      large_value = values[:large_value]
      small_value = values[:small_value]
      it "#{small_value} <= #{large_value} should be valid" do
        expect(LessThanOrEqualToModel.new(values)).to be_valid
      end
    end
  end

  context "invalid less_than_or_equal_to" do
    [
      { small_value: 10, large_value: 1 },
      { small_value: -5, large_value: -10 },
      { small_value: -3.4, large_value: -12 },
      { small_value: -3, large_value: -5.5 },
      { small_value: -4.4, large_value: -6.5 },
      { small_value: 123, large_value: -133 },
      { small_value: 13.2, large_value: 13 },
      { large_value: nil, small_value: -133 },
      { large_value: 123, small_value: nil },
      { large_value: nil, small_value: nil },
      { small_value: 123, large_value: "あいうえお" },
      { small_value: "あいうえお", large_value: -133 },
      { small_value: "あいうえお", large_value: "あいうえお" }
    ].each do |values|
      large_value = values[:large_value]
      small_value = values[:small_value]
      it "#{small_value} <= #{large_value} should be invalid" do
        expect(LessThanOrEqualToModel.new(values)).not_to be_valid
      end
    end
  end

  context "valid between" do
    [
      { large_value: 15, small_value: 10, middle_value: 12 },
      { large_value: 20, small_value: -10, middle_value: 0 },
      { large_value: 15, small_value: 0, middle_value: 15 },
      { large_value: 15, small_value: 0, middle_value: 0 },
      { large_value: 15, small_value: 15, middle_value: 15 }
    ].each do |values|
      large_value = values[:large_value]
      mid_value = values[:middle_value]
      small_value = values[:small_value]
      it "#{mid_value} in [#{small_value}, #{large_value}] should be valid" do
        expect(BetweenModel.new(values)).to be_valid
      end
    end
  end

  context "invalid between" do
    [
      { large_value: 15, small_value: 15, middle_value: 5 },
      { large_value: 20, small_value: 10, middle_value: 30 },
      { large_value: 20, small_value: 10, middle_value: 5 },
      { large_value: 10, small_value: 20, middle_value: 15 },
      { large_value: nil, small_value: -133, middle_value: 15 },
      { large_value: 123, small_value: nil, middle_value: 15 },
      { large_value: nil, small_value: nil, middle_value: 15 },
      { large_value: nil, small_value: -133, middle_value: nil },
      { large_value: 123, small_value: nil, middle_value: nil },
      { large_value: nil, small_value: nil, middle_value: nil },
      { large_value: 123, small_value: 100, middle_value: nil },
      { small_value: 123, large_value: "あいうえお" },
      { small_value: "あいうえお", large_value: -133 },
      { small_value: "あいうえお", large_value: "あいうえお" }
    ].each do |values|
      large_value = values[:large_value]
      mid_value = values[:middle_value]
      small_value = values[:small_value]
      it "#{mid_value} in [#{small_value}, #{large_value}] should be invalid" do
        expect(BetweenModel.new(values)).not_to be_valid
      end
    end
  end
end
