# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{locator}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Sven Fuchs"]
  s.date = %q{2010-02-03}
  s.description = %q{Generic html element locators for integration testing}
  s.email = %q{svenfuchs@artweb-design.de}
  s.files = [
    "Rakefile",
     "lib/locator.rb",
     "lib/locator/boolean.rb",
     "lib/locator/dom.rb",
     "lib/locator/dom/nokogiri.rb",
     "lib/locator/dom/nokogiri/element.rb",
     "lib/locator/dom/nokogiri/page.rb",
     "lib/locator/element.rb",
     "lib/locator/element/area.rb",
     "lib/locator/element/button.rb",
     "lib/locator/element/elements_list.rb",
     "lib/locator/element/field.rb",
     "lib/locator/element/form.rb",
     "lib/locator/element/label.rb",
     "lib/locator/element/labeled_element.rb",
     "lib/locator/element/link.rb",
     "lib/locator/element/select.rb",
     "lib/locator/element/select_option.rb",
     "lib/locator/element/text_area.rb",
     "lib/locator/version.rb",
     "lib/locator/xpath.rb",
     "test/all.rb",
     "test/element/button_test.rb",
     "test/element/field_test.rb",
     "test/element/link_test.rb",
     "test/locator_test.rb",
     "test/test_helper.rb",
     "test/xpath/boolean_test.rb",
     "test/xpath/xpath_test.rb"
  ]
  s.homepage = %q{http://github.com/svenfuchs/locator}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Generic html element locators for integration testing}
  s.test_files = [
    "test/all.rb",
     "test/element/button_test.rb",
     "test/element/field_test.rb",
     "test/element/link_test.rb",
     "test/locator_test.rb",
     "test/test_helper.rb",
     "test/xpath/boolean_test.rb",
     "test/xpath/xpath_test.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
