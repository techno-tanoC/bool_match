# coding: utf-8

module BoolMatch::Matcher
  class Boolean
    def === other
      raise "override me"
    end

    private
    def falsy? obj
      !obj
    end

    def truthy? obj
      !falsy?(obj)
    end

    def blank? obj
      obj.respond_to?(:empty?) ? obj.empty? : !obj
    end

    def present? obj
      !blank?(obj)
    end
  end

  class Truthy < Boolean
    def === other
      truthy? other
    end
  end

  class Falsy < Boolean
    def === other
      falsy? other
    end
  end

  class Blank < Boolean
    def === other
      blank? other
    end
  end

  class Present < Boolean
    def === other
      present? other
    end
  end

  class Any < Boolean
    def === other
      true
    end
  end
end
