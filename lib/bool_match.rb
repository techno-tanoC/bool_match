require "bool_match/version"

require "bool_match/matcher"

module BoolMatch
  include Matcher

  [Truthy, Falsy, Blank, Present, Any].each do |klass|
    name = klass.to_s.split('::').last.downcase
    define_method(name) do
      klass.new
    end
  end
  alias_method :_, :any
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
