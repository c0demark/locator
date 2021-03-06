module Locator
  Boolean::Or.operator, Boolean::And.operator = ' | ', ''

  class Xpath < Array
    class << self
      def xpath?(string)
        string =~ %r(^\.?//)
      end
    end

    def initialize(name = nil, attributes = {})
      super(Array(name || '*').map { |name| self.class.xpath?(name) ? name : ".//#{name}" })

      attributes.each do |name, value|
        case name
        when :class
          and!(has_class(name, value))
        else
          and!(equals(name, value))
        end
      end

      flatten!
    end

    def equals(names, values)
      case values
      when TrueClass
        "[@#{names}]"
      else
        values = Array(values).map { |value| quote(value) }
        expr= Array(names).map { |name| values.map { |value| "@#{name}=#{value}" } }.flatten
        expr.empty? ? '' : '[' + expr.join(' or ') + ']'
      end
    end

    def has_class(name, value)
      "[contains(concat(' ', @#{name}, ' '), concat(' ', \"#{value}\", ' '))]"
    end

    def contains(value)
      "/descendant-or-self::*[contains(., \"#{value}\")]"
    end

    def and!(other)
      replace(self.map { |l| Array(other).map { |r| "#{l}#{r}" } }.flatten)
    end

    def or!(other)
      other.empty? ? self : replace([self.dup, other])
    end

    def to_s
      flatten.join(' | ')
    end

    protected

      def quote(value)
        self.class.xpath?(value) ? value : "\"#{value}\""
      end
  end
end
