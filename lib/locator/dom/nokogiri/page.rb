class Locator
  module Dom
    module Nokogiri
      class Page
        attr_reader :dom

        def initialize(html)
          @dom = ::Nokogiri::HTML::Document.parse(html)
        end

        def element_by_id(id)
          elements_by_xpath("//*[@id='#{id}']").first
        end

        def elements_by_xpath(xpath)
          @dom.xpath(xpath).map { |element| Element.new(element) }
        end

        def to_s
          @dom.to_s
        end
      end
    end
  end
end