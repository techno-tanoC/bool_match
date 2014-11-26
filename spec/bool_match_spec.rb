require 'spec_helper'

describe BoolMatch do
  include BoolMatch
  shared_examples_for "match to" do |patt, value|
    
    it "match #{patt} to #{value.nil? ? "nil" : value}" do
      expect(
        case patt
        when value then true
        else false
        end).to eq true
    end
  end

  describe "Truthy" do
    it_behaves_like "match to", truthy, 1
  end
end
