module Locator
  class Element
    class Input < FormElement
      def initialize(attributes = {})
        defaults = { :type => [:text, :password , :email, :url, :search, :tel, :color] }
        super(:input, defaults.merge(attributes))
      end
    end
  end
end
