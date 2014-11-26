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
      respond_to?(:empty?) ? obj.empty? : !self
    end

    def present? obj
      !blank?
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
      blank? obj
    end
  end

  class Presense < Boolean
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
