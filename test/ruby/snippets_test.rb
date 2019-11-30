# typed: false
require "test_helper"

class Ruby::SnippetsTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Ruby::Snippets::VERSION
  end

  def test_it_does_something_useful
    assert false
  end
end
