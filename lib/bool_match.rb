require "bool_match/version"

require "bool_match/matcher"

module BoolMatch
  include Matcher
end

class Array
  def === other
    if self.size == other.size
      self.zip(other).all? do |elem, patt|
        elem === patt
      end
    else
      super
    end
  end
end
