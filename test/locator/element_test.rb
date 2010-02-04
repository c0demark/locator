require File.expand_path('../../test_helper', __FILE__)

class LocatorElementTest < Test::Unit::TestCase
  include Locator
  
  # xpath
  
  test "xpath without further arguments given" do
    assert_equal './/*', Element.new.xpath
  end
  
  test "xpath with a node name" do
    xpath = Element.new(:div).xpath
    assert_equal './/div', xpath
  end
  
  test "xpath with attributes" do
    xpath = Element.new(nil, nil, :type => 'type', :class => 'class').xpath
    assert_equal ".//*[@type=\"type\"][contains(concat(' ', @class, ' '), concat(' ', \"class\", ' '))]", xpath
  end
  
  test "xpath with node name and attributes" do
    xpath = Element.new(:div, nil, :type => 'type', :class => 'class').xpath
    assert_equal ".//div[@type=\"type\"][contains(concat(' ', @class, ' '), concat(' ', \"class\", ' '))]", xpath
  end
  
  # all
  
  test "all selects all elements when given no attributes" do
    html = '<a class="foo"></a><p class="bar"></p>'
    elements = Element.new.all(html)
    assert_equal %w(html body a p), elements.map { |element| element.tag_name }
  end
  
  test "all selects all nodes with given node name" do
    html = '<a class="foo"></a><p class="bar"></p>'
    elements = Element.new('a').all(html)
    assert_equal %w(a), elements.map { |element| element.tag_name }
  end
  
  test "all selects all nodes with attribute given to initialize" do
    html = '<a class="foo"></a><p class="bar"></p>'
    elements = Element.new(nil, nil, :class => 'foo').all(html)
    assert_equal %w(a), elements.map { |element| element.tag_name }
  end
  
  test "all selects all nodes with attribute given to all" do
    html = '<a class="foo"></a><p class="bar"></p>'
    elements = Element.new.all(html, :class => 'foo')
    assert_equal %w(a), elements.map { |element| element.tag_name }
  end
  
  # locate
  
  test "locate selects an element based on the length of the matching value" do
    html = %(
      <a href="#">the link with extra text</a>
      <a href="http://www.some-very-long-url.com">the link ...</a>
    )
    element = Element.new.locate(html, 'the link')
    assert_equal 'the link ...', element.content
  end
  
  test "locate selects an element containing whitespace" do
    html = %(
      <a href="#">
        the
        link
      </a>
    )
    assert Element.new.locate(html, 'the link')
  end
  
  test "locate selects an element containing extra tags" do
    html = '<a href="#">the <span>link</span></a>'
    assert Element.new.locate(html, 'the link')
  end
  
  test "locate selects an element containing extra text (1)" do
    html = '<a href="#">the link &raquo;</label>'
    assert Element.new.locate(html, 'the link')
  end
  
  test "locate selects an element containing extra text (2)" do
    html = '<a href="#">(the link)</label>'
    assert Element.new.locate(html, 'the link')
  end
  
  test "does not find a link when id does not match" do
    html = '<a href="" id="bar"></a>'
    assert_nil Element.new.locate(html, :id => 'foo')
  end
  
  test "does not find a link when class does not match" do
    html = '<a href="" class="bar"></a>'
    assert_nil Element.new.locate(html, :class => 'foo')
  end
end